package com.ib.interfaces;

import com.ib.controller.Types;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IBulletinHandler {
    void bulletin(int msgId, Types.NewsType newsType, String message, String exchange);
}


