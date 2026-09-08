package org.example.dao;

import org.example.interfaces.PromotionDAO;
import org.example.model.Promotion;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PromotionDAOImpl implements PromotionDAO {

    @Override
    public boolean addPromotion(Promotion promotion) {

        String sql = "{CALL sp_add_promotion(?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, promotion.getUserId());

            cs.setString(
                    2,
                    promotion.getDesignationFrom()
            );

            cs.setString(
                    3,
                    promotion.getDesignationTo()
            );

            cs.setTimestamp(
                    4,
                    Timestamp.valueOf(promotion.getDate())
            );

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }


    @Override
    public Promotion getPromotionById(int promotionId) {

        String sql = "{CALL sp_get_promotion_by_id(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, promotionId);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                Promotion promotion = new Promotion();

                promotion.setPromotionId(
                        rs.getInt("PromotionId")
                );

                promotion.setUserId(
                        rs.getInt("UserID")
                );

                promotion.setDesignationFrom(
                        rs.getString("DesignationFrom")
                );

                promotion.setDesignationTo(
                        rs.getString("DesignationTo")
                );

                promotion.setDate(
                        rs.getTimestamp("Date")
                                .toLocalDateTime()
                );

                return promotion;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    @Override
    public List<Promotion> getAllPromotions() {

        List<Promotion> promotions = new ArrayList<>();

        String sql = "{CALL sp_get_all_promotions()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql);
                ResultSet rs = cs.executeQuery()
        ) {

            while (rs.next()) {

                Promotion promotion = new Promotion();

                promotion.setPromotionId(
                        rs.getInt("PromotionId")
                );

                promotion.setUserId(
                        rs.getInt("UserID")
                );

                promotion.setDesignationFrom(
                        rs.getString("DesignationFrom")
                );

                promotion.setDesignationTo(
                        rs.getString("DesignationTo")
                );

                promotion.setDate(
                        rs.getTimestamp("Date")
                                .toLocalDateTime()
                );

                promotions.add(promotion);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return promotions;
    }


    @Override
    public boolean updatePromotion(Promotion promotion) {

        String sql = "{CALL sp_update_promotion(?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(
                    1,
                    promotion.getPromotionId()
            );

            cs.setInt(
                    2,
                    promotion.getUserId()
            );

            cs.setString(
                    3,
                    promotion.getDesignationFrom()
            );

            cs.setString(
                    4,
                    promotion.getDesignationTo()
            );

            cs.setTimestamp(
                    5,
                    Timestamp.valueOf(promotion.getDate())
            );

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean deletePromotion(int promotionId) {

        String sql = "{CALL sp_delete_promotion(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, promotionId);

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }
}
