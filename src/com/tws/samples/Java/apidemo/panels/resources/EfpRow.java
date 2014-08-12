package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.interfaces.IEfpHandler;

import javax.swing.table.AbstractTableModel;

/**
 * Created by Alfred on 8/11/2014.
 */
public class EfpRow extends TopRow implements IEfpHandler {
    public double m_basisPoints;
    public String m_formattedBasisPoints;
    public double m_impliedFuture;
    public int m_holdDays;
    public String m_futureExpiry;
    public double m_dividendImpact;
    public double m_dividendsToExpiry;

    public EfpRow(AbstractTableModel model, String description) {
        super(model, description);
    }

    @Override
    public void tickEFP(int tickType, double basisPoints, String formattedBasisPoints, double impliedFuture, int holdDays, String futureExpiry, double dividendImpact, double dividendsToExpiry) {
        m_basisPoints = basisPoints;
        m_formattedBasisPoints = formattedBasisPoints;
        m_impliedFuture = impliedFuture;
        m_holdDays = holdDays;
        m_futureExpiry = futureExpiry;
        m_dividendImpact = dividendImpact;
        m_dividendsToExpiry = dividendsToExpiry;

        m_model.fireTableDataChanged();
    }
}
