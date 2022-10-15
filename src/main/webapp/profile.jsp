<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!--<script>
function removefun() {  

	document.getElementById('name').removeAttribute('', '');
	document.getElementById('inputEmail').removeAttribute('disabled', 'disabled');
	document.getElementById('uname').removeAttribute('disabled', '');
	document.getElementById('inputAddress').removeAttribute('disabled', '');
	document.getElementById('phoneno').removeAttribute('disabled', '');
	document.getElementById('inputCity').removeAttribute('disabled', '');
	document.getElementById('inputState').removeAttribute('disabled', '');
	document.getElementById('inputZip').removeAttribute('disabled', '');
	document.getElementById('check').removeAttribute('disabled', '');
	}

</script>
-->
 
<script>
function removefun(form){
    $.each(form, function(key, id) {
        if ( uname.hasAttribute("disabled")){
            uname.removeAttribute("disabled");
        }
    });
}
</script>

<%@include file="Css/bootstrap.jsp" %>
<%@include file="Css/navbar.jsp" %>
<%@ page import="entity.*" %>

<% userentity user=(userentity)session.getAttribute("user"); %>

<body>
<div style="display:flex; justify-content:center; margin-top:100px;">
<div class="card d-flex w-50 h-50 p-5" style="">
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
if(session.getAttribute("pmsg")!=null){ %>
<h3 text-center text-success>Profile updated</h3>
<%} 
session.removeAttribute("pmsg");
%>
<form class="" action="profileUpdate.jsp">
  <div class="form-row">
  <div class="form-group col-md-12" >
    <label for="">Name</label>
    <input type="text" class="form-control" id="name" placeholder="" value="<%= user.getName() %>" disabled>
  </div>
    <div class="form-group col-md-6">
      <label for="inputEmail">Email</label>
      <input type="email" class="form-control" id="inputEmail" placeholder="Email" value="<%= user.getEmail() %>" disabled>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Username</label>
      <input type="text" class="form-control" id="uname" placeholder="username" value="<%= session.getAttribute("username") %>" disabled>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" value="<%= user.getAddress() %>" disabled>
  </div>
  <div class="form-group">
    <label for="phoneno">Phone no:</label>
    <input type="text" class="form-control" id="phoneno" placeholder="" value="<%= user.getPhoneno() %>" disabled>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" value="<%= user.getCity() %>" disabled>
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control" disabled>
        <option selected><%= user.getState() %></option>
        <option>Andhra Pradesh</option>
        <option>Arunachal Pradesh	</option>
        <option>Assam</option>
        <option>Bihar</option>
        <option>Chhattisgarh</option>
        <option>Goa</option>
        <option>Gujarat</option>
        <option>Haryana</option>
        <option>Himachal Pradesh</option>
        <option>Jammu and Kashmir</option>
        <option>Jharkhand</option>
        <option>Karnataka</option>
        <option>Kerala</option>
        <option>Madhya Pradesh	</option>
        <option>Maharashtra</option>
        <option>Manipur</option>
        <option>Meghalaya</option>
        <option>Mizoram</option>
        <option>Nagaland</option>
        <option>Odisha</option>
        <option>Punjab</option>
        <option>Rajasthan</option>
        <option>Sikkim</option> 
        <option>Tamil Nadu</option> 
        <option>Telangana</option> 
        <option>Tripura</option> 
        <option>Uttar Pradesh</option> 
        <option>Uttarakhand</option> 
        <option>West Bengal</option> 
         
      </select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip" value="<%= user.getPincode() %>" disabled>
    </div>
  </div>
  <!--<div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="check" disabled>
      <label class="form-check-label" for="gridCheck">
        Agree to all the terms and conditions
      </label>
    </div>
  </div>-->
  <button type="submit" class="btn btn-primary" onclick="removefun(this.form)">Edit</button>
</form>
</div>
</div>
</body>
</html>