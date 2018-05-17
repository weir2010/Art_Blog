<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 写信</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/fakeLoader.css"
	rel="stylesheet">
</head>

<body class="white-bg" style="opacity:0">
	 <div id="fakeloader"></div>
	 <div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<a class="btn btn-block btn-primary compose-mail"
								href="javascript:void(0);">访客统计</a>
							<div class="space-25"></div>
							<h5>访客状态</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li  ><a href="${pageContext.request.contextPath}/admin/visit/visit.jsp">
										<i class="fa fa-inbox "></i>记录数<span
										class="a-1 label label-info pull-right">0 </span>
								</a></li>
								<li  ><a href="${pageContext.request.contextPath}/admin/visit/visitTable.jsp">
										<i class="fa fa-user "></i>用户数<span
										class="a-2 label label-warning pull-right">0 </span>
								</a></li>
								<li ><a href="${pageContext.request.contextPath}/admin/visit/black.jsp">
										<i class="fa fa-lock "></i> 黑名单<span
										class="a-3 label label-danger pull-right">0 </span>
								</a></li>
							</ul>
							<h5>指定日期查询</h5>
							<div style="margin-bottom:20px" class="input-daterange input-group" id="datepicker">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<input type="text" class="input-sm form-control" id="start" />
								<span class="input-group-addon">到</span> <input type="text"
									class="input-sm form-control" id="end" />
							</div>
							<button id="reset" onclick="reset()"
								class="btn-sm btn-outline btn-white pull-right"
								style="margin-top:-15px" type="button">重置</button>
							<h5>快捷查询</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
                                <li><a href="javascript:void(0)" onclick="fastToSearch('四川')"><i class="fa fa-tag"></i>四川地区</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('教育网')"><i class="fa fa-tag"></i>教育网</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('IE')"><i class="fa fa-tag"></i>IE </a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Chrome')"><i class="fa fa-tag"></i>Chrome </a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Windows')"><i class="fa fa-tag"></i>Windows</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Android')"><i class="fa fa-tag"></i>Android</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('iPhone')"><i class="fa fa-tag"></i>iPhone</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('iPad')"><i class="fa fa-tag"></i>iPad</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Mac')"><i class="fa fa-tag"></i>Mac</a></li>
                            </ul>
							
							
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<h2>访客统计</h2>

						<table id="allVisit" data-mobile-responsive="true">

						</table>
						<input type="hidden" class="ipCity">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>



	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
	<!-- Data picker -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<!-- Bootstrap table -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script>
	var globalCount=0;
			$("#fakeloader").fakeLoader({
		        timeToHide:10000, //Time in milliseconds for fakeLoader disappear
		        zIndex:999, // Default zIndex
		        spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
		        bgColor:"#fff", //Hex, RGB or RGBA colors
		        //imagePath:"yourPath/customizedImage.gif" //If you want can you insert your custom image
		    }); 
			
			setTimeout(function () {
	       		$('body').css('opacity','1');
	       		$('body').attr("class", "gray-bg") //添加样式
			},100);
	
		$(document).ready(function() {
			
			initVisitCount();
			initBlackIpCount();
			selectVisit();
			
		});
		

	    var returnAllCount=function(){
			if(globalCount==3){
				setTimeout(function () {
					$('#fakeloader').css('display','none');
				},500);
			}
		}

		var initVisitCount = function() {
			$.ajax({
				url : '../selectVisitListByIp',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					var count = 0;
					$(".a-2").html('0');
					$(".a-2").html(data.list.length);
					for (var i = 0; i < data.list.length; i++) {
						count += data.list[i].count;
					}
					$(".a-1").html(count);
				},
				error : function() {
					swal("初始化资源数目错误", "请重新操作", "error");
				}
			});
			globalCount++;
			 returnAllCount();
		};

		var initBlackIpCount = function() {
			$.ajax({
				url : '../selectAllBlackIpCount',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					$(".a-3").html('0');
					$(".a-3").html(data.count);
				},
				error : function() {
					swal("初始化资源数目错误", "请重新操作", "error");
				}
			});
			globalCount++;
			 returnAllCount();
		};

		var fastToSearch=function(fastKey){
			$(".search .form-control").val(fastKey);
			var params = $('#allVisit').bootstrapTable('getOptions');
			params.queryParams = function(params) {
				return {
					pageSize : params.limit,
					page : (params.offset) / params.limit + 1,
					ip : fastKey,
					platformType : fastKey,
					browserType : fastKey,
					city : fastKey,
					startTime : $('#start').val(),
					endTime : $('#end').val(),
				};
			};
			$('#allVisit').bootstrapTable('refresh', params);
			
		}
		
		var reset = function() {
			$('#start').val("");
			$('#end').val("");
			var params = $('#allVisit').bootstrapTable('getOptions');
			params.queryParams = function(params) {
				return {
					pageSize : params.limit,
					page : (params.offset) / params.limit + 1,
					ip : $(".search .form-control").val(),
					startTime : "",
					endTime : "",
				};
			};
			$('#allVisit').bootstrapTable('refresh', params);
		};
		
		//指定日期查询事件
		var selectVsitByDate = function(startTime, endTime) {
			var params = $('#allVisit').bootstrapTable('getOptions');
			params.queryParams = function(params) {
				return {
					pageSize : params.limit,
					page : (params.offset) / params.limit + 1,
					ip : $(".search .form-control").val(),
					platformType : $(".search .form-control").val(),
					browserType : $(".search .form-control").val(),
					city : $(".search .form-control").val(),
					startTime : startTime,
					endTime : endTime,
				};
			};
			$('#allVisit').bootstrapTable('refresh', params);
		};

		$('#start').datepicker({
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true,
			format : 'mm/dd/yyyy',
			todayHighlight : true,
			endDate : new Date(),
		}).on('changeDate', function(ev) {
			var start = ev.date.valueOf();
			$('#start').val(Format(start, "yyyy-MM-dd"));
			if ($('#end').val() != "" && $('#start').val() > $('#end').val()) {
				swal("指定日期范围出错", "请重新检查", "error");
			} else if ($('#start').val() != "" && $('#end').val() != "") {
				selectVsitByDate($('#start').val(), $('#end').val());
			}
		});

		$('#end').datepicker({
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true,
			format : 'mm/dd/yyyy',
			todayHighlight : true,
			endDate : new Date(),
		})
				.on(
						'changeDate',
						function(ev) {
							var end = ev.date.valueOf();
							$('#end').val(Format(end, "yyyy-MM-dd"));
							if ($('#start').val() != ""
									&& $('#start').val() > $('#end').val()) {
								swal("指定日期范围出错", "请重新检查", "error");
							} else if ($('#start').val() != ""
									&& $('#end').val() != "") {
								selectVsitByDate($('#start').val(), $('#end')
										.val());
							}

						});

		//初始化表格数据
		var selectVisit = function() {
			$('#allVisit')
					.bootstrapTable(
							{
								method : 'post',
								url : "../selectLikeVisitListGroupByIp",
								dataType : "json",
								striped : false, //使表格带有条纹  
								pagination : true, //在表格底部显示分页工具栏  
								pageSize : 10,
								pageNumber : 1,
								sortOrder : "asc",
								sortable : true,
								pageList : [ 10, 20, 30 ],
								idField : "id", //标识哪个字段为id主键  
								showToggle : false, //名片格式  
								cardView : false,//设置为True时显示名片（card）布局  
								showColumns : true, //显示隐藏列    
								showRefresh : true, //显示刷新按钮  
								search : true,//是否显示搜索框
								searchOnEnterKey : true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
								queryParams : queryParams, //参数  
								sidePagination : "server", //服务端处理分页
								searchTimeOut : 500, //设置搜索超时时间
								toolbarAlign : 'left',//工具栏对齐方式
								buttonsAlign : 'right',//按钮对齐方式
								toolbar : '#toolbar',//指定工作栏
								searchAlign : 'right',
								contentType : "application/x-www-form-urlencoded",
								formatLoadingMessage : function() {
									return "请稍等，正在加载中...";
								},
								formatNoMatches : function() { //没有匹配的结果  
									return "无符合条件的记录";
								},
								responseHandler : function(res) {
									return {
										"total" : res.pageInfo.total,//总页数
										"rows" : res.pageInfo.list
									//数据
									};
								},
								columns : [
										{
						                      title: '序号',
						                      align: 'center',
						                      valign: 'middle',
						                      width: '5%',
						                      formatter: function (value, row, index) {  
						                    	  var index1=index+1;
						                          var id='<span title="ID:'+row.id+'">'+index1+'</span>';
						                    	  return id;   
						                      }  
						                  }, 
										{
											title : 'IP',
											field : 'ip',
											align : 'center',
											width : '15%',
											formatter:operateOpinionFormatter
										},
										{
											title : '地区',
											field : 'city',
											align : 'center',
											width : '18%',
											formatter:operateOpinionFormatter
										},
										{
											title : '浏览器',
											field : 'browserType',
											align : 'center',
											width : '12%',
											formatter:operateOpinionFormatter
										},
										{
											title : '系统',
											field : 'platformType',
											align : 'center',
											width : '12%',
											formatter:operateOpinionFormatter
										},
										{
											title : '访问次数',
											field : 'count',
											align : 'center',
											width : '8%',
										},
										{
											title : '操作',
											field : 'id',
											align : 'center',
											width : '15%',
											formatter : function(value, row,
													index) {
													var id=row.id;
													var ip = row.ip;
													var city = row.city;
													var browserType=row.browserType;
													var platformType=row.platformType;
												
												var b = '<a  class=" btn-sm btn-danger"   onclick="addBlackIp(\''+id+'\',\''+ip+'\',\''+city+'\',\''+browserType+'\',\''+platformType+'\')"><i class="fa  fa-lock" ></i> 加入黑名单</a> ';
												return b;
											}
								  } ]
							});
			globalCount++;
			 returnAllCount();
		};

		//传参数到后台
		function queryParams(params) {
			return {
				//每页多少条数据
				pageSize : params.limit,
				page : (params.offset) / params.limit + 1,
				ip : $(".search .form-control").val(),
				platformType : $(".search .form-control").val(),
				browserType : $(".search .form-control").val(),
				city : $(".search .form-control").val(),
				startTime : "",
				endTime : "",
			};
		}
		
		var addBlackIp=function(id,ip,city,browserType,platformType){
			 var params = {
					vid:id, 
					ip : ip,
					city : city,
					browsertype:browserType,
					platformtype:platformType,
					prarm:'将ip为<span class="text-info">#'+ip+'#</span>的用户<span class="text-danger">添加黑名单</span>'
				}; 
			 swal({
	             title: "确定添加到黑名单吗",
	             text: "放入黑名单,该IP将无法访问网站！",
	             type: "warning",
	             showCancelButton: true,
	             confirmButtonColor: "#DD6B55",
	             confirmButtonText: "确定",
	             closeOnConfirm: false
	         }, function () {
					$.ajax({
						url : '../addBlackIp',
						type : 'post',
						data : params,
						dataType : 'json',
						success : function(data) {
							if(data.status==2){
								swal("添加失败", "该IP已在黑名单中", "error");
							}else if (data.status == 200) {
								initVisitCount();
								initBlackIpCount();
								$("#allVisit").bootstrapTable('refresh');
								swal("添加成功", "", "success");
							} else if (data.status == 0) {
								swal("添加失败", "", "error");
							}
						},
						error : function() {
							swal("添加错误", "请重新操作", "error");
						}
					});
	         });
		};
		

		//设置 字数不超过宽度限制
		  var operateOpinionFormatter=function(value,row,index){ 
			  var title = "";
				var visitName = $(".search .form-control").val();
				var visitNameLow = $(".search .form-control").val().toLowerCase();
				if (value.search(visitName) != -1|| value.toLowerCase().search(visitNameLow) != -1) {
					var strs = new Array();
					strs = value.split("");
					var strStartIndex = value.indexOf(visitName);
					var strEndIndex = strStartIndex+ visitName.length- 1;
					if (value.toLowerCase().search(visitNameLow) != -1) {
						strStartIndex = value.toLowerCase().indexOf(visitNameLow);
						strEndIndex = strStartIndex+ visitNameLow.length- 1;
					}
					for (var i = 0; i < strs.length; i++) {
						if (i >= strStartIndex&& i <= strEndIndex) {
							title += '<span style="color:#000;font-weight:bold;">'
									+ strs[i]
									+ '</span>';
						} else {
							title += '<span >'+ strs[i]+ '</span>';
						}
					}
				} else {
					title = value;
				}
				return title;
	        }
		
		
		
		//格式化时间
		function Format(datetime, fmt) {
			if (parseInt(datetime) == datetime) {
				if (datetime.length == 10) {
					datetime = parseInt(datetime) * 1000;
				} else if (datetime.length == 13) {
					datetime = parseInt(datetime);
				}
			}
			datetime = new Date(datetime);
			var o = {
				"M+" : datetime.getMonth() + 1, //月份   
				"d+" : datetime.getDate(), //日   
				"h+" : datetime.getHours(), //小时   
				"m+" : datetime.getMinutes(), //分   
				"s+" : datetime.getSeconds(), //秒   
				"q+" : Math.floor((datetime.getMonth() + 3) / 3), //季度   
				"S" : datetime.getMilliseconds()
			//毫秒   
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
	</script>

</body>

</html>
