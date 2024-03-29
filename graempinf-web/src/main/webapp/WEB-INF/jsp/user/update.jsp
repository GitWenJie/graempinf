<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/admin/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/validate/main.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/core/jquery.graempinf.validate.js"></script>
<%@ include file="../commonresource.jsp" %>
<script type="text/javascript">
$(function(){
	$("#addForm").graempinfValidate();
});
</script>
</head>
<body>
<div id="content">
	<h3 class="admin_link_bar">
		<jsp:include page="inc.jsp"></jsp:include>
	</h3>
	<sf:form method="post" modelAttribute="userDto" id="addForm">
	<table class="addTable"cellspacing="0" cellPadding="0">
	<sf:hidden path="userUuid"/><sf:hidden path="userName"/>
	<sf:hidden path="userPassWord"/>
	<sf:hidden path="createDate"/>
		<thead><tr><td colspan="2">修改用户-->${userDto.userName}</td></tr></thead>
		<tr>
			<td class="rightTd">显示名称(可以是中文):</td><td class="leftTd"><sf:input path="userNickName" size="30"/></td>
		</tr>
		<tr>
			<td class="rightTd">联系电话:</td><td><sf:input path="userPhone" size="30"/></td>
		</tr>
		<tr>
			<td class="rightTd">电子邮件:</td><td><sf:input path="userEmail" size="30"/><sf:errors path="userEmail"/></td>
		</tr>
		<tr>
			<td class="rightTd">状态:</td>
			<td>
				<sf:select path="userStatus">
					<sf:option value="0">停用</sf:option>
					<sf:option value="1">启用</sf:option>
				</sf:select>
			</td>
		</tr>
		<tr>
			<td class="rightTd">角色:</td>
			<td>
				<%-- <c:forEach var="role" items="${roles }">
					${role.descr }<input type="checkbox" name="roleIds" value="${role.id }"/>
				</c:forEach> --%>
				
				<sf:checkboxes  items="${roles}" itemLabel="roleName" itemValue="roleUuid" path="roleIds"/>
			</td>
		</tr>
		<tr>
			<td class="rightTd">用户组:</td>
			<td>
				<%-- <c:forEach var="role" items="${roles }">
					${role.descr }<input type="checkbox" name="roleIds" value="${role.id }"/>
				</c:forEach> --%>
				<sf:checkboxes items="${groups}" path="groupIds" itemLabel="groupName" itemValue="gruopUuid"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="centerTd"><input type="submit" value="修改用户"/><input type="reset"/></td>
		</tr>
	</table>
	</sf:form>
</div>
</body>
</html>