package com.ib.interfaces;

import com.ib.controller.NewTickType;
import com.ib.controller.Types;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface ITopMktDataHandler {
    void tickPrice(NewTickType tickType, double price, int canAutoExecute);
    void tickSize(NewTickType tickType, int size);
    void tickString(NewTickType tickType, String value);
    void tickSnapshotEnd();
    void marketDataType(Types.MktDataType marketDataType);
}


