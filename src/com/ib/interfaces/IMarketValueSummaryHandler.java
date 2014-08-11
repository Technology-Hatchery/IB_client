package com.ib.interfaces;

import com.ib.controller.MarketValueTag;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IMarketValueSummaryHandler {
    void marketValueSummary( String account, MarketValueTag tag, String value, String currency);
    void marketValueSummaryEnd();
}


