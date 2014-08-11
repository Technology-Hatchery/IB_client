package com.ib.interfaces;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IEfpHandler extends ITopMktDataHandler {
    void tickEFP(int tickType, double basisPoints, String formattedBasisPoints, double impliedFuture, int holdDays, String futureExpiry, double dividendImpact, double dividendsToExpiry);
}


