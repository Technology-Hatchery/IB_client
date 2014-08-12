package com.ib.interfaces;

import com.ib.client.CommissionReport;
import com.ib.client.Execution;
import com.ib.controller.NewContract;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface ITradeReportHandler {
    void tradeReport(String tradeKey, NewContract contract, Execution execution);

    void tradeReportEnd();

    void commissionReport(String tradeKey, CommissionReport commissionReport);
}


