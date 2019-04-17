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
		  	<button type="button" class='btn btn-primary add'>新增</button>
		  	<button type="button" class='btn btn-danger delete'>删除</button>
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
		
		<!-- 员工添加 模态框 -->
		<div class="modal fade addModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">员工添加</h4>
		      </div>
		      <div class="modal-body">
					<form class="form-horizontal addForm">
					  <div class="form-group">
					    <label for="inputlastName3" class="col-sm-2 control-label">lastName</label>
					    <div class="col-sm-10">
					      <input type="lastName" name="empName" class="form-control" id="lastName3" placeholder="LastName">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">email</label>
					    <div class="col-sm-10">
					      <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email">
					    </div>
					  </div>
					  <div class="form-group">
					  		<label for="inputradio3" class="col-sm-2 control-label">gender</label>
						    <div class="col-sm-10">
							    <label class="radio-inline ">
								  <input type="radio" name="gender" id="man" value="M" checked>男
								</label>
								<label class="radio-inline">
								  <input type="radio" name="gender" id="women" value="W">女
								</label>
						    </div>
					  </div>
					  <div class="form-group">
					  	<label for="inputdepartment3" class="col-sm-2 control-label">department</label>
					    <div class="col-sm-4">
					      <select class="form-control" name="dId">
					      
						  </select>
					    </div>
					  </div>
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary save">保存</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 员工编辑 模态框 -->
		<div class="modal fade editModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">员工修改</h4>
		      </div>
		      <div class="modal-body">
					<form class="form-horizontal editForm">
					  <div class="form-group">
					    <label for="inputlastName3" class="col-sm-2 control-label">lastName</label>
					    <div class="col-sm-10">
					      <input type="lastName" name="empName" class="form-control lastName" id="lastName3" placeholder="LastName">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">email</label>
					    <div class="col-sm-10">
					      <input type="email" name="email" class="form-control email" id="inputEmail3" placeholder="Email">
					    </div>
					  </div>
					  <div class="form-group">
					  		<label for="inputradio3" class="col-sm-2 control-label">gender</label>
						    <div class="col-sm-10">
							    <label class="radio-inline ">
								  <input type="radio" name="gender" id="man" value="M" checked>男
								</label>
								<label class="radio-inline">
								  <input type="radio" name="gender" id="women" value="W">女
								</label>
						    </div>
					  </div>
					  <div class="form-group">
					  	<label for="inputdepartment3" class="col-sm-2 control-label">department</label>
					    <div class="col-sm-4">
					      <select class="form-control dId" name="dId">
					      
						  </select>
					    </div>
					  </div>
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary save">保存</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>
</body>

<script type="text/javascript" src="<%=contextPath %>/script/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/script/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/script/index.js"></script>
</html>