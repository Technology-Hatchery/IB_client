package com.ib.interfaces;

import com.ib.controller.NewContract;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IPositionHandler {
    void position( String account, NewContract contract, int position, double avgCost);
    void positionEnd();
}


