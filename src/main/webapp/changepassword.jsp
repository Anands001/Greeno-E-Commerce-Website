<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@include file="Css/navbar.jsp" %>
<%@include file="Css/bootstrap.jsp" %>

<html>
<body style="background-color: #e6ffe6">

<div class="container px-5 py-5" style="margin-top:100px; background-color:white; border-radius:30px;
  width:600px; min-height:500px;">




<form method="post" action="passwordChange" class="pt-2">

<% if(session.getAttribute("psmsg")=="incorrect"){ %>
<h3 class="text-center text-danger">Incorrect password</h3>
<%}
session.removeAttribute("psmsg");
%>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">username</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
        name="username" value=<%= session.getAttribute("username") %> readonly required>
    <div id="emailHelp" class="form-text"></div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Old Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="oldpassword" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">New Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="newpassword" required>
  </div>
  <div class=" text-center" style="align-items: center; padding:30px;">
  <button type="submit" class="btn btn-primary">Change password</button><br><br>
  </div>
 
</form>
</div>
</body>
</html>