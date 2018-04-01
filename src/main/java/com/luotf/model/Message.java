package com.luotf.model;

import java.util.Date;

public class Message {
    /**  */
    private Integer id;

    /** 邮箱 */
    private String email;

    /** 留言内容 */
    private String content;

    /** 留言时间 */
    private Date addtime;

    /** 是否回复，0未回复，1回复 */
    private Integer isreply;

    /** 博主回复内容 */
    private String replycontent;

    /** 博主回复时间 */
    private Date replytime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_message.id
     *
     * @return the value of t_message.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_message.id
     *
     * @param id the value for t_message.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_message.email
     *
     * @return the value of t_message.email
     *
     * @mbggenerated
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_message.email
     *
     * @param email the value for t_message.email
     *
     * @mbggenerated
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_message.content
     *
     * @return the value of t_message.content
     *
     * @mbggenerated
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_message.content
     *
     * @param content the value for t_message.content
     *
     * @mbggenerated
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_message.addTime
     *
     * @return the value of t_message.addTime
     *
     * @mbggenerated
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_message.addTime
     *
     * @param addtime the value for t_message.addTime
     *
     * @mbggenerated
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_message.isReply
     *
     * @return the value of t_message.isReply
     *
     * @mbggenerated
     */
    public Integer getIsreply() {
        return isreply;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_message.isReply
     *
     * @param isreply the value for t_message.isReply
     *
     * @mbggenerated
     */
    public void setIsreply(Integer isreply) {
        this.isreply = isreply;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_message.replyContent
     *
     * @return the value of t_message.replyContent
     *
     * @mbggenerated
     */
    public String getReplycontent() {
        return replycontent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_message.replyContent
     *
     * @param replycontent the value for t_message.replyContent
     *
     * @mbggenerated
     */
    public void setReplycontent(String replycontent) {
        this.replycontent = replycontent == null ? null : replycontent.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_message.replyTime
     *
     * @return the value of t_message.replyTime
     *
     * @mbggenerated
     */
    public Date getReplytime() {
        return replytime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_message.replyTime
     *
     * @param replytime the value for t_message.replyTime
     *
     * @mbggenerated
     */
    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }
}