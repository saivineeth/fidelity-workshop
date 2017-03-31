
<%
if(session.getAttribute("userid")==null)
       {
    response.sendRedirect("login-new.jsp");
}
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);
String userid=(String)session.getAttribute("userid");
%>
<%@ page import ="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
//String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "fidelity";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<style media="screen">
html, body
{
	height: 100%;
}
body
{
	margin: 0px;
	padding: 0px;
	background: #45543D;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 12pt;
	font-weight: 300;
	color: #6c6c6c
}
h1, h2, h3
{
	margin: 0;
	padding: 0;
	font-weight: 600;
	color: #454445;
}
p, ol, ul
{
	margin-top: 0;
}
ol, ul
{
	padding: 0;
	list-style: none;
}
p
{
	line-height: 180%;
}
strong
{
}
a
{
	color: #2C383B;
}
a:hover
{
	text-decoration: none;
}
.container
{
	margin: 0px auto;
	width: 1200px;
}
#header
{
	position: relative;
	height: 75px;
}
.container
{
	margin: 0px auto;
	width: 1200px;
}
#logo
{
	position: absolute;
	top: 1.5em;
	width: 100%;
}
#logo h1
{
	display: inline-block;
	font-size: 2.5em;
	text-transform: uppercase;
	font-weight: 700;
	color: #ED7070;
	padding-right: 0.50em;
	border-right: 1px solid rgba(0,0,0,.1);
}
#logo span
{
	display: inline-block;
	padding-right: .50em;
	letter-spacing: 0.10em;
	text-transform: uppercase;
	font-size: 0.90em;
}
#logo a
{
	text-decoration: none;
	color: #FFF;
}
#logo .fa
{
	color: #8dc63f;
}
#logo .fa:after
{
	position: absolute;
	display: inline-block;
	padding-right: 2em;
}
#menu
{
	position: absolute;
	right: 0;
	top: 1.2em;
}
#menu ul
{
	display: inline-block;
}
#menu li
{
	display: block;
	float: left;
	text-align: center;
}
#menu li a, #menu li span
{
	display: inline-block;
	margin-left: 1px;
	padding: 1em 1.5em 0em 1.5em;
	letter-spacing: 0.10em;
	text-decoration: none;
	font-size: 1em;
	text-transform: uppercase;
	outline: 0;
	color: #FFF;
}
#menu li:hover a, #menu li.active a, #menu li.active span
{
}
#menu li:hover,#menu li a:hover
{
	color:#ffff00;
}
#userbutton
{
	padding: 1em 1em;
	background: #45543D;
	-moz-transition: opacity 0.25s ease-in-out;
	-webkit-transition: opacity 0.25s ease-in-out;
	-o-transition: opacity 0.25s ease-in-out;
	-ms-transition: opacity 0.25s ease-in-out;
	transition: opacity 0.25s ease-in-out;
	letter-spacing: 0.20em;
	text-decoration: none;
	font-weight: 400;
	color: #ffffff;
	border: none;
    padding: 1px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
}
#userbutton:before{
	content: "Hi ";
}
#userbutton:after{
	content: "!";
}
.dropdown {
    position: relative;
    display: inline-block;
}
/* Dropdown Content (Hidden by Default) */
.dropbtn {
	text-decoration: none;
	font-size: 1em;
	text-transform: uppercase;
	outline: 0;
	color: #FFF;
    color: white;
    padding: 18px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    background: #45543D;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #45543D;;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 0px 0px 15px 0px;
}
/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
/* Change color of dropdown links on hover */
.dropdown-content a:hover {
    color: #ffff00;
}
/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}
.maintype
{
	padding: 5em 0em;
	background: #E8E7C1;
	text-align: center;
	height:60%;
}
#copyright
{
	padding: 6em 0em 10em 0em;
	border-top: 1px solid rgba(255,255,255,0.08);
	position:absolute;
    bottom:0;
    width:100%;
    height:60px;   /* Height of the footer */
}
#footerblock {
	 position:absolute;
   bottom:0;
   width:100%;
   height:8%;
}
#footerblock p
{
	letter-spacing: 0.20em;
	text-align: center;
	text-transform: uppercase;
	font-size: 0.80em;
	color: rgba(255,255,255,0.3);
}
</style>

<!doctype html>
<html>
<head>
<script src="http://use.fontawesome.com/e859433d96.js"></script>
</head>

<body>
<div class="page">
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="${homeUrl}">TRADR</a>
			</h1>
			<button id="userbutton"> Admin </button>
		</div>
		<div id="menu">
			<ul>
				<li>
				  <div class="dropdown">
					<button class="dropbtn">User Management</button>
					<div class="dropdown-content">
						<a href="change-user.jsp">Set User as Admin</a>
                                                <a href="change-admin.jsp">Set Admin as User</a>
						<a href="delete-user.jsp">Delete User</a>
						<a href="household.jsp">Link Users to household</a>
					</div>
				  </div>
	            </li>
                    <li><form  action="stockmaster.jsp"  ><button type="submit" class="dropbtn">Stock Management</button></form>
                    </li>
                    <li>
                    <div class="dropdown">
					<button class="dropbtn">Manage Funds</button>
					<div class="dropdown-content">
						<a href="manageFunds.jsp">Credit Funds</a>
						<a href="manageFunds.jsp">Debit Funds</a>
					</div>
				  </div>
                    </li>
                    <li><button id="loginbutton" onclick="location.href='/tradr/logout.jsp'">Logout</button></li>
                        </ul>

		</div>
	</div>
</div>
		</div>
<div class="maintype">
<h2 align="center"><font><strong>Admin</strong></font></h2>
<table  class="table table-hover">
<tr style="background-color:#45543D">
<td><b>CUSTOMER_LOGIN_NAME</b></td>
<td><b>INVESTOR_TRADER</b></td>
<td><b>HOUSEHOLD_ID</b></td>
<td><b>TYPE</b></td>
<td><b>CHANGE</b></td>
</tr>

<%
try{ 
  

      
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM customer where TYPE='admin' and CUSTOMER_LOGIN_NAME !='"+userid+"'";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<tr>

<form action="ctype.jsp" method="get">
<td><%=resultSet.getString("CUSTOMER_LOGIN_NAME") %></td>
<td><%=resultSet.getString("INVESTOR_TRADER") %></td>
<td><%=resultSet.getString("HOUSEHOLD_ID") %></td>
<td><%=resultSet.getString("TYPE") %></td>
<td>
<input type="checkbox" name="uname" value="<%=resultSet.getString("CUSTOMER_LOGIN_NAME")%>"/>

</td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<input type="submit" value="Change" name="change" class="btn btn-default"/>
</form>
<button type="button" class="btn btn-default btn-arrow-left"  onclick="goBack()">Back</button>
</div>
<div id="footerblock">
			<p>&copy; Tradr. All rights reserved.</p>
		</div>
	</div>
<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html>
