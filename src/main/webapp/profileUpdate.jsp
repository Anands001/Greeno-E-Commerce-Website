<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
</head>

<%@include file="Css/bootstrap.jsp" %>
<%@include file="Css/navbar.jsp" %>
<%@ page import="entity.*" %>

<% userentity user=(userentity)session.getAttribute("user"); %>

<body>
<div style="display:flex; justify-content:center; margin-top:100px;">
<div class="card d-flex w-50 h-50 p-5" style="">
<form class="" action="profileservlet" method="post">
  <div class="form-row">
  <div class="form-group col-md-12">
    <label for="">Name</label>
    <input type="text" class="form-control" id="" placeholder="" value=<%= user.getName() %> name="name">
  </div>
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="Email" value=<%= user.getEmail() %> name="email">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Username</label>
      <input type="text" class="form-control" id="" placeholder="username" value=<%= session.getAttribute("username") %> name="username" readonly>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="address">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Phone no:</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="" value=<%= user.getPhoneno() %> name="phoneno">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" value=<%= user.getCity() %> name="city">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control" name="state">
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
      <input type="text" class="form-control" id="inputZip" value=<%= user.getPincode() %> name="pincode">
    </div>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck" required>
      <label class="form-check-label" for="gridCheck">
        Agree to all the terms and conditions
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Update</button>
</form>
</div>
</div>
</body>
</html>