package org.interfaces;

import org.model.Promotion;

import java.util.List;

public interface IPromotionDAO {

    boolean addPromotion(Promotion promotion);

    Promotion getPromotionById(int promotionId);

    List<Promotion> getAllPromotions();

    boolean updatePromotion(Promotion promotion);

    boolean deletePromotion(int promotionId);
}
