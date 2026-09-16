package org.example.service;

import org.example.dao.AttendanceDaoImpl;
import org.example.dao.AttendanceDaoImpl.AttendanceResultWrapper;
import org.example.model.Attendance;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class AttendanceService {


        private final AttendanceDaoImpl dao = new AttendanceDaoImpl();


        public String processAttendanceAction(String action, int userId) {
            try {
                switch (action) {
                    case "checkin" -> { dao.checkIn(userId); return "Checked In successfully!"; }
                    case "lunchin" -> { dao.lunchIn(userId); return "Lunch In recorded!"; }
                    case "lunchout" -> { dao.lunchOut(userId); return "Lunch Out recorded!"; }
                    case "checkout" -> { dao.checkOut(userId); return "Checked Out successfully!"; }
                    default -> { return "Invalid action structural layout execution payload state."; }
                }
            } catch (Exception e) {
                return "Execution Alert: " + e.getMessage();
            }
        }

        public Attendance getTodayStatus(int userId) {
            try {
                return dao.getTodayAttendance(userId);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }


    public AttendanceResultWrapper validatedAttendanceHistory(
            int userId, String status, String dateRange,
            String startDate, String endDate, String sort,
            int limit, int offset, LocalDateTime userJoiningDate
    ) throws Exception {

            if("CUSTOM".equalsIgnoreCase(dateRange))
            {
//                checking if user has enterd both the dates
                boolean hasStartDate = startDate != null && !startDate.trim().isEmpty();
                boolean hasEndDate = endDate != null && !endDate.trim().isEmpty();

                if(hasStartDate != hasEndDate)
                {
                    throw  new IllegalArgumentException("Enter Start Date And End Date");
                }

//                checking today date
                LocalDate today = LocalDate.now();

            try {
//
                if (endDate != null && !endDate.trim().isEmpty()) {
                    LocalDate endSearchDate = LocalDate.parse(endDate);
                    if (endSearchDate.isAfter(today)) {
                        throw  new IllegalArgumentException("End Date Should not be Greater then Todays Date");
                    }
                }

                if (startDate != null && !startDate.trim().trim().isEmpty() && userJoiningDate != null) {
                    LocalDate startSearchDate = LocalDate.parse(startDate);
                    LocalDate joiningDate = userJoiningDate.toLocalDate();

                    if (startSearchDate.isBefore(joiningDate)) {
                        System.out.println();
                    }

                    if (endDate != null && !endDate.trim().isEmpty()) {
                        LocalDate endSearchDate = LocalDate.parse(endDate);
                        if (startSearchDate.isAfter(endSearchDate)) {
                            System.out.println("");
                        }
                    }

                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            }

        return dao.getAttendanceByCustom(
                userId, status, dateRange, startDate, endDate, sort, limit, offset
        );
    }



}
