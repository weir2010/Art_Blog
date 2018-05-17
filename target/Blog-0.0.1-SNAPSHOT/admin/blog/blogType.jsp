<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/fakeLoader.css" rel="stylesheet">
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
								href="javascript:void(0);">博客类别</a>
							<div class="space-25"></div>
							<h5 class="tag-title">增加类别</h5>
							<form role="form" class="form-inline" id="commentForm1">
								<div class="form-group" >
									<input type="text" placeholder="请输入类别名称" id="typename" required="" aria-required="true"
										class="form-control" style="width:76%;">
									<button id="addType" class="btn btn-white pull-right" type="button"
										>提交</button>
									<span class="tip"
										style="color:#a94442;font-size:12px;padding: 0px;"></span>
								</div>
							</form>
							
							<h5>所有类别</h5>
							<ul class="category-list" style="padding: 0">

							</ul>

							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<h2>博客类别</h2>

						<table id="allBlogType" data-mobile-responsive="true">

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog" style="width: 25%;">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                            <h3 class="m-t-none m-b">修改类别名称</h3>

                            <form role="form" id="commentForm2">
                                <div class="form-group">
                                    <label>原始名称：</label><span id="oldTypeName"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" placeholder="新名称" required="" aria-required="true" class="form-control" id="newTypeName">
                                </div>
                                <span class="tip2" style="color:#a94442"></span>
                                <div id="update">
                                    
                                </div>
                            </form>
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
	<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
	
	<!-- jQuery Validation plugin javascript-->
    <script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/validate/messages_zh.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/validate/form-validate-demo.js"></script>
	
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
	    }); 
		setTimeout(function () {
       		$('body').css('opacity','1');
       		$('body').attr("class", "gray-bg") //添加样式
		},100);
	$(document).ready(function() {
		
		initType();
		selectBlogType();
	});
	
	var returnAllCount=function(){
		if(globalCount==2){
			setTimeout(function () {
				$('#fakeloader').css('display','none');
			},500);
		}
	}
	
	var initType=function(){
		//查询出文章类别
		//设置参数，表示查询所有的类别
		var params ={
				"data":"all"
		};
		$.ajax({
            url:'../selectBlogType',    
            type:'post',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var typeNameAndNum='';
            	var circle = new Array("text-navy","text-danger"," text-info","text-primary","text-warning");
            	var label = new Array("label-primary","label-danger"," label-info","label-success","label-warning");
                for (var i = 0; i < data.length; i++) {
                	typeNameAndNum+='<li><a href="javascript:void(0);"> <i class="fa fa-circle '+circle[i%5]+'"></i> '+data[i].typename+'<span class="label '+label[i%5]+' pull-right">'+data[i].num+' 篇</span></a></li>'
                }
                // 初始化数据
                $(".category-list").html(typeNameAndNum);
            },    
		    error:function(){
		    	swal("初始化类别错误", "请重新操作", "error");
		    }	
        });
		globalCount++;
		returnAllCount();
	}

	 //初始化表格数据
	  var selectBlogType=function(){
		  $('#allBlogType').bootstrapTable({
				method: 'post',  
				url: "../selectBlogTypeListByPage", 
				dataType: "json",  
				striped: false,     //使表格带有条纹  
				pagination: true, //在表格底部显示分页工具栏  
				pageSize: 10,  
				pageNumber: 1,
				sortOrder: "asc",
				sortable: true,   
				pageList: [10, 20, 30],  
				idField: "id",  //标识哪个字段为id主键  
				showToggle: false,   //名片格式  
				cardView: false,//设置为True时显示名片（card）布局  
				showColumns: true, //显示隐藏列    
				showRefresh: true,  //显示刷新按钮  
				search: true,//是否显示搜索框
				searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
				queryParams: queryParams, //参数  
			    sidePagination: "server", //服务端处理分页
			    searchTimeOut:500, //设置搜索超时时间
			    toolbarAlign:'left',//工具栏对齐方式
			    buttonsAlign:'right',//按钮对齐方式
			    toolbar:'#toolbar',//指定工作栏
			    searchAlign:'right',
			    contentType: "application/x-www-form-urlencoded",
			    formatLoadingMessage: function () {  
			        return "请稍等，正在加载中...";  
			      },  
			      formatNoMatches: function () {  //没有匹配的结果  
			        return "无符合条件的记录";  
			      },  
			    responseHandler: function(res) {
	                return {
	                    "total": res.pageInfo.total,//总页数
	                    "rows": res.pageInfo.list   //数据
	                 };
	            },
			    columns: [
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
		                      title: '类别',
		                      field: 'typename',
		                      align: 'center',
		                      width: '12%',
		                      formatter:function(value,row,index){ 
		                    	  var type="";
		                    	  var typename=$(".search .form-control").val();
		                    	  var typenameLow=$(".search .form-control").val().toLowerCase();
		                    	 if(row.typename.search(typename)!=-1||row.typename.toLowerCase().search(typenameLow)!=-1){
		                    		  var strs= new Array();
			                    	  strs=row.typename.split("");
		                    		  var strStartIndex = row.typename.indexOf(typename);
		                    		  var strEndIndex = strStartIndex+typename.length-1;
		                    		  if(row.typename.toLowerCase().search(typenameLow)!=-1){
		                    			  strStartIndex = row.typename.toLowerCase().indexOf(typenameLow);
			                    		  strEndIndex = strStartIndex+typenameLow.length-1;
		                    		  }
		                    		  for(var i=0;i<strs.length;i++){
		                    			  if(i>=strStartIndex&&i<=strEndIndex){
		                    				  type+='<span style="color:#000;font-weight:bold;">'+strs[i]+'</span>';
		                    			  }else{
		                    				  type+='<span >'+strs[i]+'</span>';
		                    			  }
		                    		  }
		                    	  }else{
		                    		  type=row.typename;
		                    	  }
		                    	  return type;
			   	                }
		                  },
		                  
		                  {
		                      title: '数量',
		                      field: 'num',
		                      align: 'center',
		                      width: '8%',
		                  },
		                  
		                  {
		                      title: '发表时间',
		                      field: 'addTime',
		                      align: 'center',
		                      width: '15%',
		                      formatter:function(value,row,index){  
		                    	 return Format(row.addTime,"yyyy-MM-dd hh:mm:ss");
			   	                 } 
		                  },
		                  {
		                      title: '操作',
		                      field: 'id',
		                      align: 'center',
		                      width: '12%',
		                      formatter:function(value,row,index){
			                   var a = '<a  class=" btn-sm btn-info" data-toggle="modal" data-target="#modal-form" onclick="selectBlogTypeById('+row.id+')"><i class="fa fa-edit" ></i> 编辑</a> ';  
			                   var b = '<a  class=" btn-sm btn-danger"   onclick="deleteBlogType('+ row.id + ',\''+row.typename+'\')"><i class="fa fa-trash-o" ></i> 删除</a> '; 
		                   	 return a+b;  
		                    } 
		                  }
		              ]
		      });
		  globalCount++;
		  returnAllCount();
	  }
	
	
			//传参数到后台
		function queryParams(params){
	        return{
	            //每页多少条数据
	            pageSize: params.limit,
	            page:(params.offset)/params.limit+1,
	            typename:$(".search .form-control").val(),
	        };
	    }
	
		var selectBlogTypeById=function(id){
			var params ={
				id:id
				};
			$.ajax({
                   url:'../selectBlogTypeById',    
                   type:'post',
                   data:params,
                   dataType:'json',    
                   success:function (data) { 
                    if(data.status==200){
                    	$("#oldTypeName").html(data.blogType.typename);
                    	var updateButton=' <button class="btn btn-sm btn-primary pull-right m-t-n-xs" onclick="updateBlogType('+data.blogType.id+',\''+data.blogType.typename+'\')" type="button"><strong>提交</strong></button>'
                    	$("#update").html(updateButton);
                    }else if(data.status==0){
                    	swal("查询失败", "不存在该类别信息", "error");
                    }	
                    },    
        		    error:function(){
        		    	swal("查询错误", "请重新操作", "error");
        		    }	
                }); 
			
		};
		
	 	var updateBlogType=function(id,typename){
	 		var params ={
	 				'id':id,
        			'typename':$("#newTypeName").val(),
        			 prarm:'将类别名称<span class="text-info">#'+typename+'#</span>修改为<span class="text-info">#'+$("#newTypeName").val()+'#</span>'
        	};
	 		if($("#commentForm2").valid()){
	 			 $.ajax({
	                 url:'../updateBlogType',    
	                 type:'post',
	                 data:params,
	                 dataType:'json',    
	                 success:function (data) { 
	                  if(data.status==200){
	                	$("#modal-form").modal('hide');
	                  	initType();
	                  	$("#allBlogType").bootstrapTable('refresh');
	                  	$(".tip2").html("");
	                  	$("#newTypeName").val(""); 
	                  	swal("更新成功", "", "success");
	                  }else if(data.status==2){
	                  	$(".tip2").html("该类别已经存在");
	                  }	
	                  },    
	      		    error:function(){
	      		    	swal("更新错误", "请重新操作", "error");
	      		    }	
	              });	
			     }
	 		
	 	}
		
		var deleteBlogType=function(id,name){
			var params ={
	 				id:id,
	 				prarm:'删除的博客类别为<span class="text-info">#'+name+'#</span>',
        	};
			swal({
	             title: "确定要删除该类别吗",
	             text: "删除后将无法恢复，请谨慎操作！",
	             type: "warning",
	             showCancelButton: true,
	             confirmButtonColor: "#DD6B55",
	             confirmButtonText: "删除",
	             closeOnConfirm: false
	         }, function () {
	        	 
	        	 $.ajax({
	                 url:'../deleteBlogType',    
	                 type:'post',
	                 data:params,
	                 dataType:'json',    
	                 success:function (data) { 
	                  if(data.status==200){
	                	  $("#allBlogType").bootstrapTable('refresh');
	                	  initType();
	                	  swal("删除成功！", "", "success");
	                  }else if(data.status==2){
	                	  swal("删除失败", "该类别下有博客,不能删除", "error");
	                  }else{
	                	  swal("删除失败", "请重新操作", "error");
	                  }	
	                  },    
	      		    error:function(){
	      		    	swal("删除错误", "请重新操作", "error");
	      		    }	
	              });
	         });
			
	 		 
		}	
	 	
		//只有验证通过才能执行 添加
		$("#addType").click(function(){
		    if($("#commentForm1").valid()){
		    	addBlogType();
		     }
		});
	 	
        var addBlogType=function(){
          var params ={
        			'typename':$("#typename").val(),
        			 prarm:'新增的博客类别为<span class="text-info">#'+$("#typename").val()+'#</span>',
        	};
            $.ajax({
                   url:'../addBlogType',    
                   type:'post',
                   data:params,
                   dataType:'json',    
                   success:function (data) { 
                    if(data.status==200){
                    	initType();
                    	$("#allBlogType").bootstrapTable('refresh');
                    	$(".tip").html("");
                    	$("#typename").val("");
                    	swal("添加成功", "", "success");
                    }else if(data.status==2){
                    	$(".tip").html("该类别已经存在");
                    }	
                    },    
        		    error:function(){
        		    	swal("添加类别错误", "请重新操作", "error");
        		    }	
                }); 
            };
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
        	        "M+": datetime.getMonth() + 1,                 //月份   
        	        "d+": datetime.getDate(),                    //日   
        	        "h+": datetime.getHours(),                   //小时   
        	        "m+": datetime.getMinutes(),                 //分   
        	        "s+": datetime.getSeconds(),                 //秒   
        	        "q+": Math.floor((datetime.getMonth() + 3) / 3), //季度   
        	        "S": datetime.getMilliseconds()             //毫秒   
        	    };
        	    if (/(y+)/.test(fmt))
        	        fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
        	    for (var k in o)
        	        if (new RegExp("(" + k + ")").test(fmt))
        	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        	    return fmt;
        	}   	
        
    </script>


</body>

</html>
