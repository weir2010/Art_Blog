package com.luotf.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })  
public class BlogType {
    /**  */
    private Integer id;

    /** 类别名称 */
    private String typename;

    /** 该类别下的数量 */
    private Integer num;
    
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date addTime;
    
    /**该类别下的所有博客信息*/
    private List<Blog> blogs;

    
   

	public BlogType(Integer id, String typename, Integer num, Date addTime,
			List<Blog> blogs) {
		super();
		this.id = id;
		this.typename = typename;
		this.num = num;
		this.addTime = addTime;
		this.blogs = blogs;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public BlogType() {
		// TODO Auto-generated constructor stub
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_blogtype.id
     *
     * @return the value of t_blogtype.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_blogtype.id
     *
     * @param id the value for t_blogtype.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_blogtype.typeName
     *
     * @return the value of t_blogtype.typeName
     *
     * @mbggenerated
     */
    public String getTypename() {
        return typename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_blogtype.typeName
     *
     * @param typename the value for t_blogtype.typeName
     *
     * @mbggenerated
     */
    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_blogtype.num
     *
     * @return the value of t_blogtype.num
     *
     * @mbggenerated
     */
    public Integer getNum() {
        return num;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_blogtype.num
     *
     * @param num the value for t_blogtype.num
     *
     * @mbggenerated
     */
    public void setNum(Integer num) {
        this.num = num;
    }

	
	@Override
	public String toString() {
		return "BlogType [id=" + id + ", typename=" + typename + ", num=" + num
				+ ", addTime=" + addTime + ", blogs=" + blogs + "]";
	}

	
    
    
}