package org.example.dao;

import org.example.model.TimeSheet;
import org.example.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimeSheetDaoImpl {


        public static class TimesheetResultWrapper {
            private final List<TimeSheet> timesheetList;
            private final int totalRecords;

            public TimesheetResultWrapper(List<TimeSheet> timesheetList, int totalRecords) {
                this.timesheetList = timesheetList;
                this.totalRecords = totalRecords;
            }

            public List<TimeSheet> getTimesheetList()
            { return timesheetList; }
            public int getTotalRecords() { return totalRecords; }
        }

        /**
         * Inserts a new timesheet record dynamically into the database schema table.
         */
        public void insertTimesheet(TimeSheet timesheet) throws Exception {
            String sql = "INSERT INTO Timesheets (UserId, Date, WorkHours, Status, CreatedBy, CreatedAt, ProjectId) " +
                    "VALUES (?, ?, ?, ?, ?, NOW(), ?)";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, timesheet.getUserId());
                stmt.setTimestamp(2, Timestamp.valueOf(timesheet.getDate()));
                stmt.setInt(3, timesheet.getWorkHours());
                stmt.setString(4, timesheet.getStatus());
                stmt.setString(5, timesheet.getCreatedBy());
                stmt.setInt(6, timesheet.getProjectId());

                stmt.executeUpdate();
            }
        }

        public TimesheetResultWrapper getTimesheetsCustom(
                Integer userId, int projectId, String dateRange, String searchQuery, int limit, int offset) throws Exception {

            List<TimeSheet> timesheetList = new ArrayList<>();
            int totalRecords = 0;
            String query = "{ call getTimesheetsByCustom(?,?,?,?,?,?) }";

            try (Connection connection = DBConnection.getConnection();
                 CallableStatement callableStatement = connection.prepareCall(query)) {

                if (userId != null && userId > 0) {
                    callableStatement.setInt(1, userId);
                } else {
                    callableStatement.setNull(1, Types.INTEGER);
                }

                callableStatement.setInt(2, projectId);
                callableStatement.setString(3, (dateRange != null && !dateRange.trim().isEmpty()) ? dateRange : "");
                callableStatement.setString(4, (searchQuery != null && !searchQuery.trim().isEmpty()) ? searchQuery : null);
                callableStatement.setInt(5, limit);
                callableStatement.setInt(6, offset);

                try (ResultSet rs = callableStatement.executeQuery()) {
                    while (rs.next()) {
                        // Extract dynamic total count exactly once from the dataset rows window
                        if (totalRecords == 0) {
                            totalRecords = rs.getInt("TOTAL_RECORDS");
                        }

                        TimeSheet row = TimeSheet.builder()
                                .timesheetId(rs.getInt("TimesheetId"))
                                .userId(rs.getInt("UserId"))
                                .date(rs.getTimestamp("Date").toLocalDateTime())
                                .workHours(rs.getInt("WorkHours"))
                                .status(rs.getString("Status"))
                                .employeeName(rs.getString("EmployeeName")) // Maps custom string join elements
                                .teamName(rs.getString("TeamName"))
                                .projectId(rs.getInt("ProjectId"))
                                .build();

                        timesheetList.add(row);
                    }
                }
            }
            return new TimesheetResultWrapper(timesheetList, totalRecords);
        }


}
