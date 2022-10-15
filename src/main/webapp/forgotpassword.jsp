<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="Css/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot password</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
function fun1() {  
	document.getElementById('sub').setAttribute('disabled', '');
	document.getElementById('input2').setAttribute('disabled', '');
	}  
</script>
</head>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-validate"); %>
<body style="background-color: #e6ffe6; background-size: 100%">
<div class="" style="display:flex; justify-content:center; margin-top:150px;">
<div class="card " style=" width:700px;">
<form class="p-5 " method="post">
<div class="tab">
 <div class="form-row">
     <div class="form-group col-md-12">
    <label for="inputUsername">Username</label>
    <input type="text" class="form-control" id="inputUsername" placeholder="" name="username"  value="<%= session.getAttribute("username") %>" disabled>
  </div>
  </div>
  
  <div class="form-group">
    <label for="input1">Security Question</label>
    <input type="text" class="form-control" id="input1"  placeholder="" value="<%= session.getAttribute("secqns")%>" disabled>
  </div>
  <div class="form-group">
    <label for="input2">Answer</label>
    <input type="text" class="form-control" id="input2"  placeholder="" name="answer" <% if(session.getAttribute("out")=="success"){ %>
  onclick="fun1()" <%} %> autocomplete="off">
    <% if(session.getAttribute("out")=="failed"){ %>
    <div id="" class="form-text text-danger">Answer is incorrect</div>
    <%
    session.removeAttribute("out");
    } 
    
    %>
    
  </div>
  </div>
  <button type="submit" class="btn btn-primary"   <% if(session.getAttribute("out")=="success"){ %>
  onclick="fun1()" <%} %> id="sub" formaction="forgotservlet2">submit</button>
  <% if(session.getAttribute("out")=="success"){ %>
  <div class="tab pt-3">
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">New password</label>
      <input type="text" class="form-control" id="inputEmail4"  placeholder="New password" name="newpassword">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control"  id="inputPassword4" placeholder="Confirm Password" name="newpassword1">
    </div>
  </div>
  <% if(session.getAttribute("passwordmsg")!=null){ %>
   <div id="" class="form-text text-danger">password does not match</div>
   <%} 
   session.removeAttribute("passwordmsg");
   %>
  </div>
 
  
  <button type="submit" class="btn btn-primary"  id="" method="post" formaction="forgotUpdate">Change password</button>
   <% } 
   %>
   
</form>
</div>
</div>
</body>
</html>