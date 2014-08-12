package com.tws.samples.Java.apidemo.panels.resources;

/**
 * Created by Alfred on 8/11/2014.
 */
public class MarginRowKey {
    String m_tag;
    String m_currency;

    public MarginRowKey(String key, String currency) {
        m_tag = key;
        m_currency = currency;
    }

    @Override
    public int hashCode() {
        int cur = m_currency != null ? m_currency.hashCode() : 0;
        return m_tag.hashCode() + cur;
    }

    @Override
    public boolean equals(Object obj) {
        MarginRowKey other = (MarginRowKey) obj;
        return m_tag.equals(other.m_tag) &&
                (m_currency == null && other.m_currency == null || m_currency != null && m_currency.equals(other.m_currency));
    }
}
