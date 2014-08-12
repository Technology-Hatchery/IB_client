package com.ib.interfaces;

import com.ib.controller.NewContractDetails;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IInternalHandler {
    void contractDetails(NewContractDetails data);

    void contractDetailsEnd();
}


