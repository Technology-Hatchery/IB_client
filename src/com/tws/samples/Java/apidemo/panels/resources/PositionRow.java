package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.NewContract;

/**
 * Created by Alfred on 8/11/2014.
 */
public class PositionRow {
    String m_account;
    NewContract m_contract;
    int m_position;
    double m_avgCost;

    void update(String account, NewContract contract, int position, double avgCost) {
        m_account = account;
        m_contract = contract;
        m_position = position;
        m_avgCost = avgCost;
    }
}
