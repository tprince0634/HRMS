package org.example.dao;

import org.example.model.Attendance;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDaoImpl {

    private void executeProcedure(String sql, int userId) throws Exception {
        try (Connection conn = DBConnection.getConnection(); CallableStatement stmt = conn.prepareCall(sql)) {
            stmt.setInt(1, userId);
            stmt.execute();
        }
    }

    public void checkIn(int userId) throws Exception { executeProcedure("{call CheckIn(?)}", userId); }
    public void lunchIn(int userId) throws Exception { executeProcedure("{call LunchIn(?)}", userId); }
    public void lunchOut(int userId) throws Exception { executeProcedure("{call LunchOut(?)}", userId); } // Adjust if named sp_LunchOut in DB
    public void checkOut(int userId) throws Exception { executeProcedure("{call CheckOut(?)}", userId); } // Adjust if named sp_CheckOut in DB

    public Attendance getTodayAttendance(int userId) throws Exception {
        Attendance attendance = null;
        try (Connection conn = DBConnection.getConnection();
             CallableStatement stmt = conn.prepareCall("{call GetTodayAttendance(?)}")) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    attendance = new Attendance();
                    attendance.setAttendanceId(rs.getInt("AttendanceId"));
                    attendance.setUserId(rs.getInt("UserId"));
                    attendance.setDate(rs.getDate("Date"));
                    attendance.setCheckIn(rs.getTime("CheckIn"));
                    attendance.setCheckOut(rs.getTime("CheckOut"));
                    attendance.setLunchIn(rs.getTime("LunchIn"));
                    attendance.setLunchOut(rs.getTime("LunchOut"));
                    attendance.setWorkingHours(rs.getTime("WorkingHours"));
                    attendance.setProductionHours(rs.getTime("ProductionHours"));
                    attendance.setOvertimeHours(rs.getTime("OvertimeHours"));
                    attendance.setBreakHours(rs.getTime("BreakHours"));
                    attendance.setLate(rs.getInt("Late"));
                    attendance.setStatus(rs.getString("Status"));
                }
            }
        }
        return attendance;
    }


     public AttendanceResultWrapper getAttendanceByCustom(
         int userId, String status, String dateRange, String startDate, String endDate, String sort, int limit, int offset) throws Exception {
         List<Attendance> getAttendanceRecords = new ArrayList<>();
         int totalRecords = 0;
         String query = "{ call getAttendanceByCustom(?,?,?,?,?,?,?,?)}";
         try (
                 Connection connection = DBConnection.getConnection();
                 CallableStatement callableStatement = connection.prepareCall(query)) {
             callableStatement.setInt(1, userId);
             callableStatement.setString(2, status != null && !status.trim().isEmpty() ? status : null);
              callableStatement.setString(3, (dateRange != null && !dateRange.trim().isEmpty()) ? dateRange : null);


             if ("CUSTOM".equalsIgnoreCase(dateRange) && startDate != null && !startDate.trim().isEmpty()) {
                 callableStatement.setDate(4, Date.valueOf(startDate));
                 callableStatement.setDate(5, Date.valueOf(endDate));
             } else {
                 callableStatement.setNull(4, java.sql.Types.DATE);
                 callableStatement.setNull(5, java.sql.Types.DATE);
             }

             callableStatement.setString(6, sort != null && !sort.trim().isEmpty() ? sort : null);
             callableStatement.setInt(7, limit);
             callableStatement.setInt(8, offset);


             try (ResultSet rs = callableStatement.executeQuery()) {
                 while (rs.next()) {
                     if (totalRecords == 0) {
                         totalRecords = rs.getInt("TOTAL_RECORDS");
                     }
                     Attendance row = Attendance.builder()
                             .attendanceId(rs.getInt("AttendanceId"))
                             .userId(rs.getInt("UserId"))
                             .date(rs.getDate("Date"))
                             .checkIn(rs.getTime("CheckIn"))
                             .checkOut(rs.getTime("CheckOut"))
                             .lunchIn(rs.getTime("LunchIn"))
                             .lunchOut(rs.getTime("LunchOut"))
                             .workingHours(rs.getTime("WorkingHours"))
                             .productionHours(rs.getTime("ProductionHours"))
                             .overtimeHours(rs.getTime("OvertimeHours"))
                             .breakHours(rs.getTime("BreakHours"))
                             .late(rs.getInt("Late"))
                             .status(rs.getString("Status"))
                             .build();

                     getAttendanceRecords.add(row);
                 }
             }
         }

      return new AttendanceResultWrapper(getAttendanceRecords, totalRecords);
}









    public record AttendanceResultWrapper(List<Attendance> historyList, int totalRecords) {}

}