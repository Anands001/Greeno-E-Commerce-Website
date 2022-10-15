<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="Css/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
</head>
<body style="background-image:url('images/sincerely-media-qlcVpZqzcEc-unsplash.jpg'); background-size: 100%">

<div class="container p-3" style=" border-radius:30px; margin-top:50px;
  width:700px; min-height:600px;">
<div class="card p-3">
<h1 class="display3 text-center" style="color: ;">SIGN UP</h1>


<form method="post" action="create" class="pt-2"> 
  <div class="mb-3">
  
   <label for="" class="form-label">Fullname</label>
    <input type="text" class="form-control mb-3" aria-describedby="" name="fullname" required>
    
   <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="text" class="form-control mb-3" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" required>
    
    <label for="" class="form-label">Phone no:</label>
    <input type="text" class="form-control mb-3" aria-describedby="" name="phoneno" required>
    
    <label for="exampleInputEmail1" class="form-label">Username</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" required>
    <div id="emailHelp" class="form-text text-danger"><% if(session.getAttribute("imsg")=="false"){%>
    Username already exists
<%} 
session.removeAttribute("imsg");
%></div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
  </div>
  
  <label for="" class="form-label">Security question</label>
  <select class="custom-select mb-3" name="secqns">
  <option selected>--select question--</option>
  <option value="what is your favourite subject?">what is your favourite subject?</option>
  <option value="What high school did you attend?">What high school did you attend?</option>
  <option value="What was your favorite food as a child?">What was your favorite food as a child?</option>
</select>

 <label for="" class="form-label">Your answer</label>
    <input type="text" class="form-control mb-3" aria-describedby="" name="answer" required>
  
  <div class=" text-center" style="align-items: center; padding:30px;">
  <button type="submit" class="btn btn-primary">Register</button><br><br>
   Already have an account<a class="btn btn-secondary text-center" href="login.jsp" style="margin-left: 5px;">LOG IN</a>
  </div>
 
</form>
</div>
</div>
</body>
</html>s