package org.example.service;


import org.example.interfaces.PromotionDAO;
import org.example.model.Promotion;

import java.util.List;

public class PromotionServiceImpl implements PromotionDAO {

    private final PromotionDAO promotionDAO;

    public PromotionServiceImpl(PromotionDAO promotionDAO) {
        this.promotionDAO = promotionDAO;
    }

    public boolean addPromotion(Promotion promotion) {
        if (promotion == null) {
            return false;
        }

        if (promotion.getUserId() <= 0) {
            return false;
        }

        if (isBlank(promotion.getDesignationFrom())
                || isBlank(promotion.getDesignationTo())
                || promotion.getDate() == null) {
            return false;
        }

        return promotionDAO.addPromotion(promotion);
    }

    public Promotion getPromotionById(int promotionId) {
        if (promotionId <= 0) {
            return null;
        }

        return promotionDAO.getPromotionById(promotionId);
    }

    public List<Promotion> getAllPromotions() {
        return promotionDAO.getAllPromotions();
    }

    public boolean updatePromotion(Promotion promotion) {
        if (promotion == null
                || promotion.getPromotionId() <= 0
                || promotion.getUserId() <= 0
                || promotion.getDate() == null
                || isBlank(promotion.getDesignationFrom())
                || isBlank(promotion.getDesignationTo())) {
            return false;
        }

        return promotionDAO.updatePromotion(promotion);
    }

    public boolean deletePromotion(int promotionId) {
        if (promotionId <= 0) {
            return false;
        }

        return promotionDAO.deletePromotion(promotionId);
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
