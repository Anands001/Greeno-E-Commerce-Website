<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@include file="Css/bootstrap.jsp" %>
    <%@include file="Css/navbar.jsp" %>
    <%@page import="ecommerce.* "  %>
<%@page import="entity.* "  %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style type="text/css">
@media (max-width: 767.98px) { .border-sm-start-none { border-left: none !important; } }

</style>
<link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>


<script>
$('.btn-number').click(function(e){
    e.preventDefault();
    
    fieldName = $(this).attr('data-field');
    type      = $(this).attr('data-type');
    var input = $("input[name='"+fieldName+"']");
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if(type == 'minus') {
            
            if(currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            } 
            if(parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if(parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
});
$('.input-number').focusin(function(){
   $(this).data('oldValue', $(this).val());
});
$('.input-number').change(function() {
    
    minValue =  parseInt($(this).attr('min'));
    maxValue =  parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());
    
    name = $(this).attr('name');
    if(valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }
});

$(".input-number").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
         // Allow: Ctrl+A
        (e.keyCode == 65 && e.ctrlKey === true) || 
         // Allow: home, end, left, right
        (e.keyCode >= 35 && e.keyCode <= 39)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});
    
</script>
</head>
<body>

<%
   List<mobileentity> ml=(List<mobileentity>)session.getAttribute("cartlist");
%>
<section style="background-color: #e6ffe6;">
  <div class="container-fluid py-5" style="width:80%">
  <h1 class="" style="font-size:30px; font-family: 'Varela Round';">Cart Items(<%= session.getAttribute("cartitems") %>)</h1>
  <hr>
  <% for(mobileentity c:ml){ %>
    <div class="row justify-content-center mb-3">
    
      <div class="col-md-12 col-xl-10">
        <div class="card shadow-0 border rounded-3">
          <div class="card-body">
            <div class="row">
              <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                  <img src="images/mobiles/<%= c.getDisplay_img() %>" style="height:200px; object-fit:contain;"
                    class="w-100" />
                  <a href="#!">
                    <div class="hover-overlay">
                      <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                    </div>
                  </a>
                </div>
              </div>
              <div class="col-md-6 col-lg-6 col-xl-6">
                <h5><%= c.getProduct_name() %></h5>
                <div class="d-flex flex-row">
                  <%if((c.getBadge().toLowerCase()).equals("new")){ %>
                <span class="badge badge-primary mb-2 badge-pill"><%= c.getBadge() %></span>
                <%}else{ %> 
                	<span class="badge badge-success mb-2 badge-pill"><%= c.getBadge() %></span>
                <%} %>
                </div>
                <div class="mt-1 mb-0 text-muted small">
                  <span><%= c.getStorage() %></span>
                  <span class="text-primary">  </span>
                  <span><%= c.getBattery() %></span>
                  <span class="text-primary">  </span>
                  <span><%= c.getDisplay() %><br /></span>
                </div>
                <div class="mb-2 text-muted small">
                  <span><%= c.getProcessor() %></span>
                  <span class="text-primary">  </span>
                  <span><%= c.getColor() %></span>
                  <span class="text-primary">  </span>
                  <span><%= c.getCategory() %><br /></span>
                </div>
                <p class="text-truncate mb-4 mb-md-0">
                  <%= c.getDescription() %>
                </p>
              </div>
              <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                <div class="d-flex flex-row align-items-center mb-1">
                  <h4 class="mb-1 me-1"><%= c.getOff_price() %>&nbsp</h4>
                  <span class="text-danger"><s><%= c.getPrice() %></s></span>
                </div>
               <div class="container">
   <div class="container py-4">
    <div class="row">
        <div class="col-sm-8 mx-auto">
            <div class="input-group">
                <span class="input-group-prepend">
                    <button type="button" class="btn btn-outline-secondary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                        <span class="fa fa-minus"></span>
                    </button>
                </span>
                <input type="text" name="quant[1]" class="form-control input-number" value="1" min="1" max="10">
                <span class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary btn-number" data-type="plus" data-field="quant[1]">
                        <span class="fa fa-plus"></span>
                    </button>
                </span>
            </div>
        </div>
    </div>
</div>
</div>
                <h6 class="text-success">Free shipping</h6>
                <div class="d-flex flex-column mt-4">
                  <a class="btn btn-danger btn-sm" type="button" href="CartDeleteServlet?username=<%= session.getAttribute("username")%>&productid=<%=c.getProductid()%>">Delete</a>
                 <!-- <button class="btn btn-outline-primary btn-sm mt-2" type="button">
                    Proceed to buy
                  </button>-->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <% } %>
    <hr>
    <div class=row>
    <div class="col-1"></div>
    <div class="col">
    <table class="table d-flex" style="">
    <table class="table" style="justify-self:center;">
  <thead class="thead-light">
    <tr>
      <th scope="col" style=" font-size:20px;">subtotal:</th>
      <th scope="col" style="text-align:right; font-size:20px;">Rs:<%= session.getAttribute("carttot") %></th>
    </tr>
  </thead>
 
</table>
    
</div>
<div class="col-1"></div>

</div>
    <!--  
    <div class="row justify-content-center mb-3">
      <div class="col-md-12 col-xl-10">
        <div class="card shadow-0 border rounded-3">
          <div class="card-body">
            <div class="row">
              <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(4).webp"
                    class="w-100" />
                  <a href="#!">
                    <div class="hover-overlay">
                      <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                    </div>
                  </a>
                </div>
              </div>
              <div class="col-md-6 col-lg-6 col-xl-6">
                <h5>Quant olap shirts</h5>
                <div class="d-flex flex-row">
                  <div class="text-danger mb-1 me-2">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                  </div>
                  <span>289</span>
                </div>
                <div class="mt-1 mb-0 text-muted small">
                  <span>100% cotton</span>
                  <span class="text-primary"></span>
                  <span>Light weight</span>
                  <span class="text-primary"></span>
                  <span>Best finish<br /></span>
                </div>
                <div class="mb-2 text-muted small">
                  <span>Unique design</span>
                  <span class="text-primary"></span>
                  <span>For men</span>
                  <span class="text-primary"></span>
                  <span>Casual<br /></span>
                </div>
                <p class="text-truncate mb-4 mb-md-0">
                  There are many variations of passages of Lorem Ipsum available, but the
                  majority have suffered alteration in some form, by injected humour, or
                  randomised words which don't look even slightly believable.
                </p>
              </div>
              <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                <div class="d-flex flex-row align-items-center mb-1">
                  <h4 class="mb-1 me-1">$14.99</h4>
                  <span class="text-danger"><s>$21.99</s></span>
                </div>
                <h6 class="text-success">Free shipping</h6>
                <div class="d-flex flex-column mt-4">
                  <button class="btn btn-primary btn-sm" type="button">Details</button>
                  <button class="btn btn-outline-primary btn-sm mt-2" type="button">
                    Add to wishlist
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-12 col-xl-10">
        <div class="card shadow-0 border rounded-3">
          <div class="card-body">
            <div class="row">
              <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(5).webp"
                    class="w-100" />
                  <a href="#!">
                    <div class="hover-overlay">
                      <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                    </div>
                  </a>
                </div>
              </div>
              <div class="col-md-6 col-lg-6 col-xl-6">
                <h5>Quant ruybi shirts</h5>
                <div class="d-flex flex-row">
                  <div class="text-danger mb-1 me-2">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                  </div>
                  <span>145</span>
                </div>
                <div class="mt-1 mb-0 text-muted small">
                  <span>100% cotton</span>
                  <span class="text-primary"> </span>
                  <span>Light weight</span>
                  <span class="text-primary">  </span>
                  <span>Best finish<br /></span>
                </div>
                <div class="mb-2 text-muted small">
                  <span>Unique design</span>
                  <span class="text-primary">  </span>
                  <span>For women</span>
                  <span class="text-primary"> </span>
                  <span>Casual<br /></span>
                </div>
                <p class="text-truncate mb-4 mb-md-0">
                  There are many variations of passages of Lorem Ipsum available, but the
                  majority have suffered alteration in some form, by injected humour, or
                  randomised words which don't look even slightly believable.
                </p>
              </div>
              <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                <div class="d-flex flex-row align-items-center mb-1">
                  <h4 class="mb-1 me-1">$17.99</h4>
                  <span class="text-danger"><s>$25.99</s></span>
                </div>
                <h6 class="text-success">Free shipping</h6>
                <div class="d-flex flex-column mt-4">
                  <button class="btn btn-primary btn-sm" type="button">Details</button>
                  <button class="btn btn-outline-primary btn-sm mt-2" type="button">
                    Add to wishlist
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>-->
  </div>
</section>
</body>
</html>