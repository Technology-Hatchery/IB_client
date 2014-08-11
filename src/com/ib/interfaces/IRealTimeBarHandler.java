package com.ib.interfaces;

/**
 * Created by Alfred on 8/10/2014.
 */

import com.ib.controller.Bar;

	public interface IRealTimeBarHandler {
    void realtimeBar(Bar bar); // time is in seconds since epoch
}


