package org.example.interfaces;

import org.example.model.Promotion;

import java.util.List;

public interface PromotionDAO {

    boolean addPromotion(Promotion promotion);

    Promotion getPromotionById(int promotionId);

    List<Promotion> getAllPromotions();

    boolean updatePromotion(Promotion promotion);

    boolean deletePromotion(int promotionId);
}
