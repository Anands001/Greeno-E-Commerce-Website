<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@include file="Css/bootstrap.jsp" %>
<%@include file="Css/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<script>
function fun4(){
	document.getElementById('inputproductname').setAttribute('name','productname');
	document.getElementById('inputorgprice').setAttribute('name', 'orgprice');  
	document.getElementById('inputoffprice').setAttribute('name', 'offprice');  
	document.getElementById('inputbadge').setAttribute('name', 'badge');  
	document.getElementById('inputcategory').setAttribute('name', 'category');  
	document.getElementById('inputcolor').setAttribute('name', 'color');  
	document.getElementById('inputDescription').setAttribute('name', 'description');  
	document.getElementById('inputStorage').setAttribute('name', 'storage');  
	document.getElementById('inputDisplay').setAttribute('name', 'display');  
	document.getElementById('inputCamara').setAttribute('name', 'camara');  
	document.getElementById('inputBattery').setAttribute('name', 'battery');  
	document.getElementById('inputProcessor').setAttribute('name', 'processor');  
	document.getElementById('inputVideo').setAttribute('name', 'video');  

	
}
</script>
<!--  <script type="text/javascript">
        document.getElementById("inputproductname").value = getSavedValue("inputproductname");    // set the value to this input
        document.getElementById("inputorgprice").value = getSavedValue("inputorgprice");   // set the value to this input
        /* Here you can add more inputs to set value. if it's saved */

        //Save the value function - save it to localStorage as (ID, VALUE)
        function saveValue(e){
            var id = e.id;  // get the sender's id to save it . 
            var val = e.value; // get the value. 
            localStorage.setItem(id, val);// Every time user writing something, the localStorage's value will override . 
        }

        //get the saved value function - return the value of "v" from localStorage. 
        function getSavedValue  (v){
            if (!localStorage.getItem(v)) {
                return "";// You can change this to your defualt value. 
            }
            return localStorage.getItem(v);
        }
</script>
<script>
function callJqueryAjax(){
	$.ajax({
	url     : 'AddProductServletimg',
	method     : 'POST',
    cache: false,
	
	contentType: 'multipart/mixed stream',
	processData: false,
	success    : function(resultText){
	$('#result').html(resultText);
	},
	error : function(jqXHR, exception){
	console.log('Error occured!!');
	}
	});
	}
</script>-->



</head>
<body>
<div  style="display:flex; justify-content:center; padding-top:15px;">
<div class="card " style="width:70%">
<form class="p-4" action="AddProductServlet" method="post">
<h3>Product Details:</h3>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputproductname">Product Name</label>
      <input type="text" class="form-control" id="inputproductname" placeholder="Product Name" name="" onchange='saveValue(this);' required>
    </div>
    <div class="form-group col-md-3">
      <label for="inputorgprice">original price</label>
      <input type="text" class="form-control" id="inputorgprice" placeholder="price" onchange='saveValue(this);' required>
    </div>
    <div class="form-group col-md-3">
      <label for="inputoffprice">Offer price</label>
      <input type="text" class="form-control" id="inputoffprice" placeholder="price" required>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group pl-3">
    <label for="" class="form-label">Badge</label>
  <select class="custom-select mb-3" id="inputbadge" required>
  <option value="new" selected>New</option>
  <option value="exclusive">Exclusive</option>
</select>
  </div>
    <div class="form-group pl-3">
    <label for="" class="form-label">Category</label>
  <select class="custom-select mb-3" id="inputcategory" required>
  <option value="mobile" selected>Mobile</option>
  <option value="laptop">Laptop</option>
  <option value="tablet">Tablet</option>
  
</select>
  </div>
  <div class="form-group col-md-4">
      <label for="inputStorage">Color</label>
      <input type="text" class="form-control" id="inputcolor" required>
    </div>
  </div>
  <div class="form-group">
    <label for="inputDescription">Description</label>
    <textarea rows="5" type="text" class="form-control" id="inputDescription" placeholder="product description" required></textarea>
  </div>
  <h3>Specifications:</h3>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputStorage">Storage</label>
      <input type="text" class="form-control" id="inputStorage" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputDisplay">Display</label>
      <input type="text" class="form-control" id="inputDisplay" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputCamara">Camara</label>
      <input type="text" class="form-control" id="inputCamara" required>
    </div>
  </div>
   <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputBttery">Battery</label>
      <input type="text" class="form-control" id="inputBattery" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputProcessor">Processor</label>
      <input type="text" class="form-control" id="inputProcessor" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputVideo">Video</label>
      <input type="text" class="form-control" id="inputVideo" aria-describedby="inputvideo" required> 
       <div id="inputvideo" class="form-text">paste only the embedded youtube video link (do not paste the code)</div>
    </div>
  </div>

  <!--  
  <div class="form-row">
  <div class="form-group col-md-4">
      <label for="inputimg">Display image</label>
      <input type="file" class="form-control" id="inputimg" name="inputdisimg">
    </div>
  <div class="form-group col-md-4">
     <label for="inputimgs">Product images</label>
     <input type="file" class="form-control" id="inputimgs" name="inputimgs" multiple>
  </div>
    <button type="submit" class="btn btn-primary" onclick="uploadFile()" formaction="">Upload images</button>
    <p id=result></p>
  </div>
  -->
  
  <button type="submit" class="btn btn-primary" onclick="fun4()">Next step</button>
</form>
</div>
</div>


</body>
</html>
