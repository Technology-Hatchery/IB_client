package com.tws.samples.Java.apidemo.panels.resources;

/**
 * Created by Alfred on 8/12/2014.
 */
public class DeepRow {
    String m_mm;
    double m_price;
    int m_size;

    public DeepRow(String mm, double price, int size) {
        update(mm, price, size);
    }

    void update(String mm, double price, int size) {
        m_mm = mm;
        m_price = price;
        m_size = size;
    }
}
