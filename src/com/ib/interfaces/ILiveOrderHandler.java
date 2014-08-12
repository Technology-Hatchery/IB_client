package com.ib.interfaces;

import com.ib.controller.NewContract;
import com.ib.controller.NewOrder;
import com.ib.controller.NewOrderState;
import com.ib.controller.OrderStatus;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface ILiveOrderHandler {
    void openOrder(NewContract contract, NewOrder order, NewOrderState orderState);

    void openOrderEnd();

    void orderStatus(int orderId, OrderStatus status, int filled, int remaining, double avgFillPrice, long permId, int parentId, double lastFillPrice, int clientId, String whyHeld);

    void handle(int orderId, int errorCode, String errorMsg);  // add permId?
}


