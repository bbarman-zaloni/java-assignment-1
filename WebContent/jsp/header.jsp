<div class="page-header">
<%
String loggedInUsername = (String) session.getAttribute("loggedInUsername");
if (loggedInUsername != null) {
%>
Welcome: <%= loggedInUsername %>,
<div style="float:right"><a href="logout">Logout</a></div>
<%
}
else {
%>
    <a href="<%= request.getContextPath() %>">User management APP:</a>
<%
}
%>
</div>

<div class="page-content">