package com.ib.interfaces;

import com.ib.controller.NewTickType;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IOptHandler extends ITopMktDataHandler {
    void tickOptionComputation(NewTickType tickType, double impliedVol, double delta, double optPrice, double pvDividend, double gamma, double vega, double theta, double undPrice);
}


