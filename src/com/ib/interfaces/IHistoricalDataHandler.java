package com.ib.interfaces;

import com.ib.controller.Bar;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IHistoricalDataHandler {
    void historicalData(Bar bar, boolean hasGaps);

    void historicalDataEnd();
}


