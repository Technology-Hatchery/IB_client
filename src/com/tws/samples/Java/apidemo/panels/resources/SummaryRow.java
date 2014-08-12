package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.AccountSummaryTag;

import java.util.HashMap;

/**
 * Created by Alfred on 8/11/2014.
 */
public class SummaryRow {
    String m_account;
    HashMap<AccountSummaryTag, String> m_map = new HashMap<AccountSummaryTag, String>();

    public void update(String account, AccountSummaryTag tag, String value) {
        m_account = account;
        m_map.put(tag, value);
    }
}
