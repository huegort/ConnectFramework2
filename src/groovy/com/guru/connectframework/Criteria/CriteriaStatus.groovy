/**
 * Created by andrewbeatty on 23/06/15.
 */
package com.guru.connectframework.Criteria

public enum CriteriaStatus{
    PENDING(1,"Pending"),
    APPROVED(2,"Approved"),
    DECLINED(3,"Declined"),
    INCOMPLETE(4,"Incomplete"),

    int blah
    String display

    public CriteriaStatus(int id, String display){
        this.blah= id
        this.display = display
    }

    public String getName(){
        return display
    }
    public String getDisplay(){
        return display
    }

}