<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="Css/bootstrap.jsp"%>
<%@include file="Css/navbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function preview() {
    frame.src=URL.createObjectURL(event.target.files[0]);
}

</script>
 <script>

 function previewMultiple(event){
         var saida = document.getElementById("adicionafoto");
         var quantos = saida.files.length;
         for(i = 0; i < quantos; i++){
             var urls = URL.createObjectURL(event.target.files[i]);
             document.getElementById("galeria").innerHTML += '<img src="'+urls+'">';
         }
     }
</script>

</head>
<body>
	<div
		style="display: flex; justify-content: center; padding-top: 150px;">
		<div class="card" style="height: 600px;">
			<h1 class="text-center">Step 2</h1>
			<form action="AddProductfinal" method="post">
				<%
				if (session.getAttribute("uimg") == "Images uploaded successfully") {
				%>
				<h3 class="text-success">Images uploaded successfully</h3>
				<%
				} else if (session.getAttribute("uimg") == "Images uploading failed") {
				%>
				<h3 class="text-danger">Error.. please try again</h3>
				<%
				}
				%>
				<div class="form-row" style="padding: 10px; height: 300px; padding-top: 50px;">

					<div class="form-group col-md-6">
						<label for="inputimg">Display image</label> 
						<input type="file" class="form-control" id="imgInp" name="inputdisimg" onchange="preview()" accept="image/*">
						  <img id="frame" src="" width="150px" height="200px" style="object-fit:contain" />
						
					</div>
					<div class="form-group col-md-6">
						<label for="inputimgs">Product images</label> <input type="file"
							class="form-control" id="image" name="inputimgs" multiple>
							<div id="frames"></div>
					</div>
					<div class="form-group col-md-2">
						<button type="submit" class="btn btn-primary" onclick=""
							formenctype="multipart/form-data"
							formaction="AddProductServletimg">Upload images</button>
					</div>
					<%
					if (session.getAttribute("uimg") == "Images uploaded successfully") {
					%>
					<div class="form-group col-md-2">
						<button type="submit" class="btn btn-primary" onclick="">Add
							Product</button>
					</div>
					<%
					} else {
					%>
					<div class="form-group col-md-2">
						<button type="submit" class="btn btn-primary" onclick="" disabled>Add
							Product</button>
					</div>
					<%
					}
					%>
				</div>
			</form>
		</div>
	</div>
</body>
</html>