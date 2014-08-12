package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.client.CommissionReport;
import com.ib.client.Execution;
import com.ib.controller.NewContract;

/**
 * Created by Alfred on 8/11/2014.
 */
public class FullExec {
    public NewContract m_contract;
    public Execution m_trade;
    public CommissionReport m_commissionReport;

    public FullExec(NewContract contract, Execution trade) {
        m_contract = contract;
        m_trade = trade;
    }
}
