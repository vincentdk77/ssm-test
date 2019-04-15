<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String contextPath = request.getContextPath();
	System.err.println(contextPath);
%>
<head>
<link href="<%=contextPath %>/script/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<meta charset="UTF-8">
<title>主页</title>
</head>
<body>
	<div class="container">
	<div class="row">
	  <div class="col-md-3"><h1>CRUD-查询</h1></div>
	</div>
	<div class="row">
	  <div class="col-md-2"><h2>SSM_CRUD</h2></div>
	</div>
	<div class="row">
	  <div class="col-md-2 col-md-offset-8">
	  	<button type="button" class='btn btn-primary'>新增</button>
	  	<button type="button" class='btn btn-danger'>删除</button>
	  </div>
	</div>
	<div class="row">
	   <table class="table table-striped">
			  <thead>
			  	<tr>
			  		  <th class="col-md-1">
				  	     <input type="checkbox"/> 
					  </th>
					  <th class="col-md-1">#</th>
					  <th class="col-md-2">lastName</th>
					  <th class="col-md-2">email</th>
					  <th class="col-md-1">gender</th>
					  <th class="col-md-2">deptName</th>
					  <th class="col-md-3">操作</th>
			  	</tr>
			  </thead>
			  <tbody>
			  </tbody>
		</table>
	</div>
	<div class="row">
	  <div class="col-md-6" id="records"></div>
	</div>
	<div class="row">
	  <div class="col-md-6 col-md-offset-6" id="navigator">
	  	
	  </div>
	</div>
	</div>
</body>

<script type="text/javascript" src="<%=contextPath %>/script/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/script/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		toPage(1);
	});
	
	function toPage(pageNo){
		$.ajax({
			url:"<%=contextPath %>/emps",
			//data:{"pageNo":1},
			//1.传递json数据
			//2.传递String数据
			data:"pageNo="+pageNo,
			type:"get",
			success:function(result){
				console.log(result);
				//alert(result);
				//填充table数据
				processTable(result);
				//填充页码、记录数的文字显示
	  			processPageAndRecords(result);
	  			//填充底部导航页数据
	  			processNavigator(result);
			},
			async:false
		});
	}
	
	function processTable(result){
		//先清空数据
		$("tbody").empty();
		$.each(result.list,function(){
			var tr = 		"<tr>                                                                           "+
							"  <td class='col-md-1'>                                                 "+
							"     <input type='checkbox'/>                                           "+
							"  </td>                                                                   "+
							"  <td class='col-md-1'>"+this.empId+"</td>                                    "+
							"  <td class='col-md-2'>"+this.empName+"</td>                                  "+
							"  <td class='col-md-2'>"+this.email+"</td>                                    "+
							"  <td class='col-md-1'>"+(this.gender=='M'?'男':'女')+"</td>                        "+
							"  <td class='col-md-2'>"+this.empId+"</td>                                    "+
							"  <td class='col-md-3'>                                                     "+
							"		<button type='button' class='btn btn-primary'>                       "+
							"			<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>  "+
							"			编辑                                                                 "+
							"		</button>                                                              "+
							"		<button type='button' class='btn btn-danger'>                           "+
							"			<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>   "+
							"			删除                                                                 "+
							"		</button>                                                              "+
							" </td>                                                                    "+
							"</tr>																		";
			$("tbody").append(tr);
		});
		
	}
	
	function processPageAndRecords(result){
		/* "pageNum":1,"pageSize":10,"size":10,"startRow":1,"endRow":10,"total":1001,"pages":101,"list":[{"empId":1,"empName":"Jerry","gender":"M" ...
			"prePage":0,"nextPage":2,"isFirstPage":true,"isLastPage":false,"hasPreviousPage":false,"hasNextPage":true,"navigatePages":5,
			"navigatepageNums":[1,2,3,4,5],"navigateFirstPage":1,"navigateLastPage":5,"lastPage":5,"firstPage":1}
		*/
		$("#records").html("当前第"+result.pageNum+"页，共"+result.pages+"页，共"+result.total+"条记录");
	}
	
	function processNavigator(result){
		//先清空数据
		$("#navigator").empty();
		/* <nav aria-label="Page navigation">
		  <ul class="pagination">
		  	<li><a href="#" id="first">首页</a></li>
		    <li>
		      <a  id="previous1">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#" id="no1">1</a></li>
		    <li><a href="#" id="no2">2</a></li>
		    <li><a href="#" id="no3">3</a></li>
		    <li><a href="#" id="no4">4</a></li>
		    <li><a href="#" id="no5">5</a></li>
		    <li id="next1">
		      <a >
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    <li><a href="#" id="last">尾页</a></li>
		  </ul>
		</nav> */
		var nav = $(
			"<nav aria-label='Page navigation'>                 "+
			"		  <ul class='pagination'>                       "+
			"		  	<li><a href='#' id='first'>首页</a></li>              "+
			"		    <li>                                        "+
			"		      <a  id='previous1'>                                     "+
			"		        <span aria-hidden='true'>&laquo;</span> "+
			"		      </a>                                      "+
			"		    </li>                                       "+
			"		    <li><a href='#' id='no1'>1</a></li>                 "+
			"		    <li><a href='#' id='no2'>2</a></li>                 "+
			"		    <li><a href='#' id='no3'>3</a></li>                 "+
			"		    <li><a href='#' id='no3'>4</a></li>                 "+
			"		    <li><a href='#' id='no3'>5</a></li>                 "+
			"		    <li >                                       "+
			"		      <a id='next1'>                                      "+
			"		        <span aria-hidden='true'>&raquo;</span> "+
			"		      </a>                                      "+
			"		    </li>                                       "+
			"		    <li><a href='#'id='last' >尾页</a></li>              "+
			"		  </ul>                                         "+
			"</nav>                                             ");
		nav.appendTo($("#navigator"));
		$("#navigator #first").click(function(){
			toPage(1);
		});
		$("#navigator #last").click(function(){
			toPage(result.pages);
		});
		$("#navigator #previous1").click(function(){
			toPage(result.pageNum-1);
		}); 
		$("#navigator #next1").click(function(){
			/* alert("next"); */
			toPage(result.pageNum+1);
		});
	}
</script>
</html>