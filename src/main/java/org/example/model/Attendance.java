package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Attendance {
    private int attendanceId;
    private int userId;
    private Date date;
    private Time checkIn;
    private Time checkOut;
    private Time lunchIn;
    private Time lunchOut;
    private  Time workingHours;
    private   Time productionHours;
    private  Time overtimeHours;
    private  Time breakHours;
    private int late;
    private String status;

    public String getFormattedCheckIn() {
        if (this.checkIn == null) {
            return "Not Checked In";
        }
        return this.checkIn.toLocalTime().format(DateTimeFormatter.ofPattern("hh:mm a"));
    }
}
