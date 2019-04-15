/**
 * 
 */

$(function(){
		toPage(1);
	});
	
	function toPage(pageNo){
		$.ajax({
			url:$("#contextPath").val()+"/emps",
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
							"  <td class='col-md-2'>"+this.department.deptName+"</td>                                    "+
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
		var nav = $(
			"<nav aria-label='Page navigation'>                 "+
			"		  <ul class='pagination'>                       "+
			"		  	<li><a href='#' id='first'>首页</a></li>              "+
			"		    <li>                                        "+
			"		      <a  href='#' id='previous1'>                                     "+
			"		        <span aria-hidden='true'>&laquo;</span> "+
			"		      </a>                                      "+
			"		    </li>                                       "+
			"		    <li><a href='#' id='no1' >1</a></li>                 "+
			"		    <li><a href='#' id='no2' >2</a></li>                 "+
			"		    <li><a href='#' id='no3' >3</a></li>                 "+
			"		    <li><a href='#' id='no4' >4</a></li>                 "+
			"		    <li><a href='#' id='no5' >5</a></li>                 "+
			"		    <li >                                       "+
			"		      <a href='#' id='next1'>                                      "+
			"		        <span aria-hidden='true'>&raquo;</span> "+
			"		      </a>                                      "+
			"		    </li>                                       "+
			"		    <li><a href='#' id='last' >尾页</a></li>              "+
			"		  </ul>                                         "+
			"</nav>                                             ");
		nav.appendTo($("#navigator"));
		//页码的显示
		if(result.pageNum == '1' || result.pageNum == '2' || result.pageNum == '3' || result.pageNum == '4' || result.pageNum == '5'){
			//$("#navigator #no1").text();
		}else if(result.pageNum == result.pages-4 || result.pageNum == result.pages-3 || result.pageNum == result.pages-2 || result.pageNum == result.pages-1 || result.pageNum == result.pages){
			$("#navigator #no1").text(result.pages-4);
			$("#navigator #no2").text(result.pages-3);
			$("#navigator #no3").text(result.pages-2);
			$("#navigator #no4").text(result.pages-1);
			$("#navigator #no5").text(result.pages);
		}else{
			$("#navigator #no1").text(result.pageNum-2);
			$("#navigator #no2").text(result.pageNum-1);
			$("#navigator #no3").text(result.pageNum);
			$("#navigator #no4").text(result.pageNum+1);
			$("#navigator #no5").text(result.pageNum+2);
		}
		//导航页码超链接实现
		$.each($("a[id^='no']"),function(){
			//设置当前页为激活状态
			if(result.pageNum==$(this).text()){
				$(this).parent().addClass("active");
			}
			//页码单击事件
			$(this).click(function(){
				toPage($(this).text());
			});
		});
		
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