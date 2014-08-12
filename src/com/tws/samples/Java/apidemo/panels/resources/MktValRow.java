package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.MarketValueTag;

import java.util.HashMap;

/**
 * Created by Alfred on 8/11/2014.
 */
public class MktValRow {
    String m_account;
    String m_currency;
    HashMap<MarketValueTag, String> m_map = new HashMap<MarketValueTag, String>();

    public MktValRow(String account, String currency) {
        m_account = account;
        m_currency = currency;
    }

    public String get(MarketValueTag tag) {
        return m_map.get(tag);
    }

    public void set(MarketValueTag tag, String value) {
        m_map.put(tag, value);
    }
}
