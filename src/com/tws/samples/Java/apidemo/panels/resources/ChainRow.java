package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.ApiController;
import com.ib.controller.NewContract;
import com.ib.controller.NewTickType;
import com.ib.interfaces.IOptHandler;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ChainRow extends ApiController.TopMktDataAdapter implements IOptHandler {
    NewContract m_c;
    double m_bid;
    double m_ask;
    double m_impVol;
    double m_delta;
    double m_gamma;
    double m_vega;
    double m_theta;
    boolean m_done;

    public ChainRow(NewContract contract) {
        m_c = contract;
    }

    @Override
    public void tickPrice(NewTickType tickType, double price, int canAutoExecute) {
        switch (tickType) {
            case BID:
                m_bid = price;
                break;
            case ASK:
                m_ask = price;
                break;
        }
    }

    @Override
    public void tickOptionComputation(NewTickType tickType, double impVol, double delta, double optPrice, double pvDividend, double gamma, double vega, double theta, double undPrice) {
        if (tickType == NewTickType.MODEL_OPTION) {
            m_impVol = impVol;
            m_delta = delta;
            m_gamma = gamma;
            m_vega = vega;
            m_theta = theta;
        }
    }

    @Override
    public void tickSnapshotEnd() {
        m_done = true;
    }
}
