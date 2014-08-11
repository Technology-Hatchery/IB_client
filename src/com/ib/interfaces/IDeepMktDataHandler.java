package com.ib.interfaces;

import com.ib.controller.Types;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IDeepMktDataHandler {
    void updateMktDepth(int position, String marketMaker, Types.DeepType operation, Types.DeepSide side, double price, int size);
}


