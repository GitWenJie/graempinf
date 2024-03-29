<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../commonresource.jsp" %>
</head>
<script type="text/javascript">
	function query(){
	  var formData = $( "#queryFrom" ).serialize();  
	     $.ajax({  
          url: 'listCount' ,  
          type: 'GET',  
          data: formData,  
          async: false,  
          cache: false,  
          success: function (returndata) {  
        		$("#content").replaceWith(returndata);
          }
	     });   
	}
	function exPort(event){
		 var formData = $( "#queryFrom" ).serialize();  
		 var url = "exportempinfocount";
			url=url+"?"+formData; 
			$(event).attr("href",url);
		}
</script>
<body>
<div id="content">
	<form id="queryFrom">
	<table cellspacing="0" class="querytable"  cellPadding="0" border="0" >
	<thead><tr><td colspan="8">就业信息统计</td></tr></thead>
	<tr>
	<td>学院名称：</td>
	<td><input type="text" name="collegeName" value="${ec.collegeName }"/></td>
	<td >学院编号：</td>
	<td><input type="text" name="collegeNum" value="${ec.collegeNum }"/></td>
	<tr>
	<td colspan="3" ></td>
	<td colspan="6">
	<a href="JavaSript:void(0);"  onclick="return query();" class="mybutton">查询</a>
	<a href="JavaSript:void(0)"  onclick="return exPort(this);" class="mybutton" >导出</a>
	</tr>
	</table>
	</form>
<form name="contentForm" id="contentForm">
	<table width="970" cellspacing="0" cellPadding="0" id="listTable">
		<thead>
		<tr>
			<td>编号</td>
			<td>学院名称</td>
			<td>学院编号</td>
			<td>就业人数(人)</td>
			<td>未就业人数(人)</td>
			<td>总人数(人)</td>
			<td>就业率</td>
			<td>未就业率</td>
		</tr>
		</thead>
		<tbody>
		<c:if test="${ecs.datas.size()>=1}">
		<c:forEach items="${ecs.datas}" var="ca">
			<tr>
			<td>${ecs.datas.indexOf(ca)+1}&nbsp;</td>
				<td>${ca[0]}</td>
				<td>${ca[1]}</td>
				<td>${ca[3] == null ? '0':ca[3]}</td>
				<td>${ca[2] == null ? '0':ca[2]}</td>
				<td>${ca[4] == null ? '0':ca[4]}</td>
				<td>${ca[6]==null ? '0':ca[6]}%</td>
				<td>${ca[5]==null ? '0':ca[5]}%</td>
				
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${ecs.datas.size()<1}">
		<td colspan="11" align="center"><c:out value="暂无就业信息！"></c:out></td>
		</c:if>
		<tfoot>
		<tr>
			<td colspan="11" style="text-align:right;margin-right:10px;">
			<jsp:include page="/jsp/pager.jsp">
				<jsp:param value="${ecs.total }" name="totalRecord"/>
				<jsp:param value="listCount" name="url"/>
				<jsp:param value="${ecs.size}" name="size"/>
			</jsp:include>
			</td>
		</tr>
		</tfoot>
		</tbody>
	</table>
	</form>
</div>
</body>
</html>