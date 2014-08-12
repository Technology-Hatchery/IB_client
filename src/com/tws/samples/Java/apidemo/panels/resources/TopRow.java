package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.ApiController;
import com.ib.controller.NewTickType;
import com.ib.controller.Types;

import javax.swing.table.AbstractTableModel;

import static com.ib.controller.Formats.fmtPct;

/**
 * Created by Alfred on 8/11/2014.
 */
public class TopRow extends ApiController.TopMktDataAdapter {
    AbstractTableModel m_model;
    public String m_description;
    public double m_bid;
    public double m_ask;
    public double m_last;
    public long m_lastTime;
    public int m_bidSize;
    public int m_askSize;
    double m_close;
    public int m_volume;
    public boolean m_frozen;

    public TopRow(AbstractTableModel model, String description) {
        m_model = model;
        m_description = description;
    }

    public String change() {
        return m_close == 0 ? null : fmtPct((m_last - m_close) / m_close);
    }

    @Override
    public void tickPrice(NewTickType tickType, double price, int canAutoExecute) {
        switch (tickType) {
            case BID:
                m_bid = price;
                break;
            case ASK:
                m_ask = price;
                break;
            case LAST:
                m_last = price;
                break;
            case CLOSE:
                m_close = price;
                break;
        }
        m_model.fireTableDataChanged(); // should use a timer to be more efficient
    }

    @Override
    public void tickSize(NewTickType tickType, int size) {
        switch (tickType) {
            case BID_SIZE:
                m_bidSize = size;
                break;
            case ASK_SIZE:
                m_askSize = size;
                break;
            case VOLUME:
                m_volume = size;
                break;
        }
        m_model.fireTableDataChanged();
    }

    @Override
    public void tickString(NewTickType tickType, String value) {
        switch (tickType) {
            case LAST_TIMESTAMP:
                m_lastTime = Long.parseLong(value) * 1000;
                break;
        }
    }

    @Override
    public void marketDataType(Types.MktDataType marketDataType) {
        m_frozen = marketDataType == Types.MktDataType.Frozen;
        m_model.fireTableDataChanged();
    }
}
