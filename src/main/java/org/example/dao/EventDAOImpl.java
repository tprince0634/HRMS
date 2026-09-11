package org.example.dao;

import org.example.interfaces.EventDAO;
import org.example.model.Event;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventDAOImpl implements EventDAO {
    @Override
    public boolean addEvent(Event event) {

        String sql = "{CALL sp_add_event(?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setString(1, event.getTitle());
            cs.setString(2, event.getDate());
            cs.setInt(3, event.getEventTypeId());
            cs.setString(4, event.getStatus());

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Event getEventById(int id) {

        String sql = "{CALL sp_get_event_by_id(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, id);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                Event event = new Event();

                event.setId(rs.getInt("Id"));
                event.setTitle(rs.getString("Title"));
                event.setDate(rs.getString("Date"));
                event.setEventTypeId(rs.getInt("EventTypeId"));
                event.setStatus(rs.getString("Status"));

                return event;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }



    @Override
    public List<Event> getAllEvents() {

        List<Event> events = new ArrayList<>();

        String sql = "{CALL sp_get_all_events()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql);
                ResultSet rs = cs.executeQuery()
        ) {

            while (rs.next()) {

                Event event = new Event();

                event.setId(rs.getInt("Id"));
                event.setTitle(rs.getString("Title"));
                event.setDate(rs.getString("Date"));
                event.setEventTypeId(rs.getInt("EventTypeId"));
                event.setStatus(rs.getString("Status"));

                events.add(event);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return events;
    }



    @Override
    public boolean updateEvent(Event event) {

        String sql = "{CALL sp_update_event(?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, event.getId());
            cs.setString(2, event.getTitle());
            cs.setString(3, event.getDate());
            cs.setInt(4, event.getEventTypeId());
            cs.setString(5, event.getStatus());

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteEvent(int id) {

        String sql = "{CALL sp_delete_event(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, id);

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }


}
