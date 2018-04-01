package com.luotf.mapper;

import java.util.List;
import java.util.Map;

import com.luotf.model.Blog;

public interface BlogMapper {
    
    int deleteBlogById(Integer id);

    int insertBlog(Blog record);

    int insertBlogSelective(Blog record);

    Blog selectBlogById(Integer id);

    List<Blog> selectBlogByTypeId(Integer id);

    /**
     *  获取上一篇博客
     * @param id
     * @return
     */
 	Blog selectPrevBlog(Integer id);

 	/**
 	 *  获取下一篇一篇博客
 	 * @param id
 	 * @return
 	 */
 	Blog selectNextBlog(Integer id);

 	/**
 	 *  获取博客信息，根据日期月份分组查询
 	 * @return
 	 */
 	List  selectBlogListByDate();

 	/**
 	 * 按不同条件组合 分页查询博客
 	 * @param map
 	 * @return
 	 */
 	List<Blog> selectBlogListByPage(Map<String, Object> map);

 	/**
 	 *  根据组合条件获取Blog条数
 	 * @param map
 	 * @return
 	 */
 	Long selectBlogCount(Map<String, Object> map);

 	
    int updateBlogSelective(Blog record);

    
    int updateBlogWithBLOBs(Blog record);

    
    int updateBlog(Blog record);
}