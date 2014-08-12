package com.tws.samples.Java.apidemo.panels.resources;

/**
 * Created by Alfred on 8/11/2014.
 */
public class MarginRow implements Comparable<MarginRow> {
    String m_tag;
    String m_currency;
    String m_val;
    String m_secVal;
    String m_comVal;

    MarginRow(String tag, String cur) {
        m_tag = tag;
        m_currency = cur;
    }

    @Override
    public int compareTo(MarginRow o) {
        return m_tag.compareTo(o.m_tag);
    }
}
