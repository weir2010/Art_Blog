package com.luotf.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luotf.model.BlackIp;
import com.luotf.service.BlackIpService;



@Controller
@RequestMapping(value = "/admin")
public class BlackIpControllerAdmin {

	@Resource(name = "blackIpServiceImpl")
	private BlackIpService blackIpService;
	
	/*
	  * 按照不同时间查询访客的数量
	  */
	/*
	 @RequestMapping(value = "/selectBlackIpListByDate",method = RequestMethod.POST)
	 @ResponseBody
	 @AccessLimit(seconds=1,maxCount=10)
	 public Map selectBlackIpListByDate(@RequestParam(value="format") String format,@RequestParam(value="startTime") String startTime,@RequestParam(value="endTime") String endTime) throws Exception{
		 Map map=new HashMap();
		 if(format!=""&&format!=null){
			 map.put("format", format);
		 }
		 if(startTime!=""&&startTime!=null){
			 map.put("startTime", startTime);
		 }
		 if(endTime!=""&&endTime!=null){
			 map.put("endTime", endTime);
		 }
		 List<Map> list=visitService.selectVisitListByDate(map);
		 Map returnMap=new HashMap();
		 if(list.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("list", list);
		 return returnMap;
	 }
	 */
	 /**
	  * 模糊组合分页查询访客信息
	  * @param id，resource
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLikeBlackIpListByPage")
	 @ResponseBody
	 public Map selectLikeBlackIpListByPage(BlackIp blackIp,@RequestParam(value="startTime") String startTime,@RequestParam(value="endTime") String endTime,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="9") Integer pageSize) throws Exception{
		 Map map=new HashMap();
		 if(startTime!=""&&startTime!=null){
			 map.put("startTime", startTime);
		 }
		 if(endTime!=""&&endTime!=null){
			 map.put("endTime", endTime);
		 }
		 if(blackIp.getIp()!=null&&blackIp.getIp()!=""){
			 map.put("ip", blackIp.getIp());
		 }
		 if(blackIp.getCity()!=null&&blackIp.getCity()!=""){
			 map.put("city", blackIp.getCity());
		 }
		 if(blackIp.getPlatformtype()!=null&&blackIp.getPlatformtype()!=""){
			 map.put("platformType", blackIp.getPlatformtype());
		 }
		 if(blackIp.getBrowsertype()!=null&&blackIp.getBrowsertype()!=""){
			 map.put("browserType", blackIp.getBrowsertype());
		 }
		 //分页显示：第1页开始，每页显示9条记录
		 PageHelper.startPage(page, pageSize);
		 List<BlackIp> blackIpList=blackIpService.selectLikeBlackIpListByPage(map);
		 PageInfo<BlackIp> pageInfo=new PageInfo<BlackIp>(blackIpList);
		 Map returnMap=new HashMap();
		 if(blackIpList.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("blackIpList", blackIpList);
		 returnMap.put("pageInfo", pageInfo);
		 return returnMap;
	 }
	 
	 
	
	 /**
	  * 更新黑名单功能
	  * @param visit
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/updateBlackIp",method = RequestMethod.POST)
	 @ResponseBody
	 public Map updateBlackIp(BlackIp blackIp) throws Exception{
		 Map map=new HashMap();
		 if(blackIpService.updateByPrimaryKeySelective(blackIp)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：更新失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 /**
	  * 添加黑名单功能
	  * @param visit
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/addBlackIp",method = RequestMethod.POST)
	 @ResponseBody
	 public Map addBlackIp(BlackIp blackIp) throws Exception{
		 Map map=new HashMap();
		
		 if(blackIpService.selectBlackIpByIp(blackIp.getIp())!=null){
			// 已经存在该IP
			 map.put("status", 2);
		 }else {
			 blackIp.setTime(new Date());
			 if(blackIpService.insert(blackIp)!=0){
				 map.put("status", 200);
			 }else{
				 //0表示：更新失败
				 map.put("status", 0);
			 }
		 }
		 return map;
	 }
	 
	 
	 /**
	  * 查询黑名单的数目
	  * @param visit
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectAllBlackIpCount",method = RequestMethod.POST)
	 @ResponseBody
	 public Map selectAllBlackIpCount() throws Exception{
		 Map map=new HashMap();
		 Long count=blackIpService.selectAllBlackIpCount();
		 if(count>=0){
			 map.put("status", 200);
		 }else{
			 //0表示：更新失败
			 map.put("status", 0);
		 }
		 map.put("count", count);
		 return map;
	 }
	 
	 
	 /**
	  * 删除黑名单功能
	  * @param visit
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/deleteBlackIp",method = RequestMethod.POST)
	 @ResponseBody
	 public Map deleteBlackIp(Integer id) throws Exception{
		 Map map=new HashMap();
		 if(blackIpService.deleteByPrimaryKey(id)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：更新失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
}