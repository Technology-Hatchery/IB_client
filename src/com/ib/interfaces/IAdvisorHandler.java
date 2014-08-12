package com.ib.interfaces;

import com.ib.controller.Alias;
import com.ib.controller.Group;
import com.ib.controller.Profile;

import java.util.ArrayList;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IAdvisorHandler {
    void groups(ArrayList<Group> groups);

    void profiles(ArrayList<Profile> profiles);

    void aliases(ArrayList<Alias> aliases);
}


