package com.tws.samples.Java.apidemo.panels.resources;

/**
 * Created by Alfred on 8/11/2014.
 */
public class PositionKey {
    String m_account;
    int m_conid;

    PositionKey(String account, int conid) {
        m_account = account;
        m_conid = conid;
    }

    @Override
    public int hashCode() {
        return m_account.hashCode() + m_conid;
    }

    @Override
    public boolean equals(Object obj) {
        PositionKey other = (PositionKey) obj;
        return m_account.equals(other.m_account) && m_conid == other.m_conid;
    }
}
