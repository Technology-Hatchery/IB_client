package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.NewContract;
import com.ib.controller.NewOrder;
import com.ib.controller.NewOrderState;

/**
 * Created by Alfred on 8/11/2014.
 */
public class OrderRow {
    public NewContract m_contract;
    public NewOrder m_order;
    public NewOrderState m_state;

    public OrderRow(NewContract contract, NewOrder order, NewOrderState state) {
        m_contract = contract;
        m_order = order;
        m_state = state;
    }
}
