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
<input type="hidden" id="contextPath" value="<%=contextPath%>"/>
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
<script type="text/javascript" src="<%=contextPath %>/script/index.js"></script>
</html>