package org.example.dao;

import org.example.interfaces.EventTypeDAO;
import org.example.model.EventType;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventTypeDAOImpl implements EventTypeDAO {
    @Override
    public boolean addEventType(EventType eventType) {

        String sql = "{CALL sp_add_event_type(?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setString(1, eventType.getName());
            cs.setString(2, eventType.getColor());

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }


    @Override
    public EventType getEventTypeById(int id) {

        String sql = "{CALL sp_get_event_type_by_id(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, id);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                EventType eventType = new EventType();

                eventType.setId(rs.getInt("Id"));
                eventType.setName(rs.getString("Name"));
                eventType.setColor(rs.getString("Color"));

                return eventType;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<EventType> getAllEventTypes() {

        List<EventType> eventTypes = new ArrayList<>();

        String sql = "{CALL sp_get_all_event_types()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql);
                ResultSet rs = cs.executeQuery()
        ) {

            while (rs.next()) {

                EventType eventType = new EventType();

                eventType.setId(rs.getInt("Id"));
                eventType.setName(rs.getString("Name"));
                eventType.setColor(rs.getString("Color"));

                eventTypes.add(eventType);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return eventTypes;
    }

    @Override
    public boolean updateEventType(EventType eventType) {

        String sql = "{CALL sp_update_event_type(?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, eventType.getId());
            cs.setString(2, eventType.getName());
            cs.setString(3, eventType.getColor());

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean deleteEventType(int id) {

        String sql = "{CALL sp_delete_event_type(?)}";

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
