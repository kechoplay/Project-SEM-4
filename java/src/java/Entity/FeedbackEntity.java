/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Timestamp;

/**
 *
 * @author TungVoDoi
 */
public class FeedbackEntity {

    private int feedid;
    private int cusid;
    private int proid;
    private Timestamp date;
    private String content;
    private int status;
    private String name;
    private String proname;

    public FeedbackEntity() {
    }

    public FeedbackEntity(int cusid, int proid, Timestamp date, String content, int status, String name) {
        this.cusid = cusid;
        this.proid = proid;
        this.date = date;
        this.content = content;
        this.status = status;
        this.name = name;
    }

    /**
     * @return the feedid
     */
    public int getFeedid() {
        return feedid;
    }

    /**
     * @param feedid the feedid to set
     */
    public void setFeedid(int feedid) {
        this.feedid = feedid;
    }

    /**
     * @return the cusid
     */
    public int getCusid() {
        return cusid;
    }

    /**
     * @param cusid the cusid to set
     */
    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    /**
     * @return the proid
     */
    public int getProid() {
        return proid;
    }

    /**
     * @param proid the proid to set
     */
    public void setProid(int proid) {
        this.proid = proid;
    }

    /**
     * @return the date
     */
    public Timestamp getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Timestamp date) {
        this.date = date;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the proname
     */
    public String getProname() {
        return proname;
    }

    /**
     * @param proname the proname to set
     */
    public void setProname(String proname) {
        this.proname = proname;
    }

}
