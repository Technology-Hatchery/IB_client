package com.ib.interfaces;

import com.ib.controller.NewOrderState;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IOrderHandler {
    void orderState(NewOrderState orderState);
    void handle(int errorCode, String errorMsg);
}


