<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="/jsp/header.jsp"/>

	<h1>User List</h1>
	<form action="user-list" method="post">
		<div style="margin-bottom:10px">
			<label for="id">ID:</label>
			<input id="id" type="text" name="id" >
		
			<label for="username">Name:</label>
			<input id="username" type="text" name="username" >
	
			<input type="submit" value="Search" />
			<span style="padding-left:50px"><a href="<%= request.getContextPath() %>/user-register">Register New User</a></span>
		</div>
		<table class="zdp-data-grid">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty userList}">
		            <tr><td>No User available!</td></tr>
			    </c:if>
				<c:if test="${not empty userList}">
		        <c:forEach var="user" items="${userList}">
		            <tr>
		            	<td>${user.id}</td>
		            	<td><a href="user-view/${user.id}">${user.username}</a></td>
		            	<td><a href="user-view/${user.id}">${user.email}</a><c:if test="${ user.id == 1 }"> (Admin)</c:if></td>
		            	<td>
		            		<c:if test="${ user.id != 1 }">
		            			<a href="user-edit/${user.id}">Edit</a> | <a href="user-delete/${user.id}">Delete</a>
		            		</c:if>
		            	</td>
		            </tr>
		        </c:forEach>
			    </c:if>
			</tbody>
		</table>

		<div style="color:red;">${ errorMessage }</div>
		<div style="color:green;">${ successMessage }</div>

	</form>
	<jsp:include page="/jsp/footer.jsp"/>
</body>
</html>