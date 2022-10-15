<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="Css/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
function removeRequired(form){
    $.each(form, function(key, id) {
        if ( password.hasAttribute("required")){
            password.removeAttribute("required");
        }
    });
}
function fun() {  
	document.getElementById('password').setAttribute('required', '');  
	}  
</script>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body style="background-image:url('images/sincerely-media-qlcVpZqzcEc-unsplash.jpg'); background-size: 100%;">
<div class="container px-5 py-5" style="margin-top:200px; background-color:white; border-radius:30px;
  width:600px; min-height:500px;">
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
if(session.getAttribute("msg")=="incorrect"){
  %>
<div
      class="alert alert-danger container mt-2 data-dismissable fade show"
      role="alert"
    >
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      username or password is incorrect!
      <div class="alert-link">Learn more</div>
    </div>
<%
}
session.removeAttribute("msg");
%>
<% if(session.getAttribute("psmsg")=="password changed"){%>
<h3 class="text-center text-success">password changed</h3>
<%}
session.removeAttribute("psmsg");
%>
<%if(session.getAttribute("imsg")=="true"){ %>
<h3 class="text-center text-success">Registered successfully</h3>
<%}
session.removeAttribute("imsg");
%>
<h1 class="display3 text-center" style="color: black;">LOG IN</h1>
<form method="post" action="logchk" class="pt-2"> 
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Username</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" required>
    <div id="emailHelp" class="form-text">We'll never share your details with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" name="password" required>
  </div>
  <div class=" text-center" style="align-items: center; padding:30px;">
  <button type="submit" class="btn btn-primary" onclick="fun()" id="" >LOG IN</button>&nbsp;
  <button type="submit" class="btn btn-warning" id="sub1" onClick="removeRequired(this.form)" formaction="forgotservlet">Forgot password</button><br><br>
   <a class="text-center" href="signup.jsp" style="color:red;">Don't have an account.create a account</a>
  </div>
 
</form>
</div>
</body>
</html>