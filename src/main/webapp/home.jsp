
<%@page import="ecommerce.* "  %>
<%@page import="entity.* "  %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Css/bootstrap.jsp" %>
<%@include file="Css/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Greeno.com</title>
  
    <link rel="stylesheet" href="style.css" />

    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700&display=swap");

      .im{
      height:400px;
      }
      .social-link {
  width: 30px;
  height: 30px;
  border: 1px solid #ddd;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
  border-radius: 50%;
  transition: all 0.3s;
  font-size: 0.9rem;
}

.social-link:hover,
.social-link:focus {
  background: #ddd;
  text-decoration: none;
  color: #555;
}

.progress {
  height: 10px;
}
    </style>
  </head>

  <body style="font-family: 'Poppins', sans-serif; background-color: #e6ffe6">
  
     <%
     response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
     
     String s1=null;
     
     
     Dao d=new Dao();
        
        List<productEntity> l1=d.product();
        
        mobiledao md=new mobiledao();
        List<mobileentity> ml=md.mobile();
        
        List<mobileentity> ex =md.exclusive();
        
        banner b=new banner();
        List banimg=b.bannerimg();
        
        
     %>
     
    <main role="main" class="container-fluid" style="width: 80%">
      <div
        id="myCarousel"
        class="carousel slide carousel-fade mb-5 mt-2"
        data-ride="carousel"
        style="width: 100%; "
      >
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
   
            <img
              src="images/<%= banimg.get(2) %>"
              class="d-block w-100 ;"
              alt="First Image";
            />
          
            <div class="carousel-caption d-none d-md-block">
              <h5>First slide label</h5>
              <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="images/<%= banimg.get(3) %>"
              class="d-block w-100"
              alt="second Image"
            />
            <div class="carousel-caption d-none d-md-block">
              <h5>First slide label</h5>
              <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="images/<%= banimg.get(4) %>"
              class="w-100"
              alt="third Image"
            />
            <div class="carousel-caption d-none d-md-block">
              <h5>First slide label</h5>
              <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
            </div>
          </div>
        </div>
        <a
          class="carousel-control-prev"
          href="#myCarousel"
          role="button"
          data-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a
          class="carousel-control-next"
          href="#myCarousel"
          role="button"
          data-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>

     
        <!-- row -->
     
        <div class="row">
          <!-- column  -->
           
          <% for(mobileentity l:ml ){ %>
          <a href="detailservlet?id=<%= l.getProductid() %>" style="text-decoration:none; color:black;">
          <div class="col-md-3">
          
            <div class="card mb-4" style="height:600px;">
            
              <img style="height:350px;  object-fit:contain;"
                src="images/mobiles/<%= l.getDisplay_img() %>"
                alt="Mobile image"
                class="card-img-top img-fluid py-3"
              />
              <div class="card-body">
                <h5 class="card-title" style="height: 40px"><%= l.getProduct_name()%></h5>
                <%if((l.getBadge().toLowerCase()).equals("new")){ %>
                <span class="badge badge-primary mb-2 badge-pill"><%= l.getBadge() %></span>
                <%}else{ %> 
                	<span class="badge badge-success mb-2 badge-pill"><%= l.getBadge() %></span>
                <%} %>
                
                <p class="card-text">
                Price:<i class="fa-solid fa-indian-rupee-sign"></i><%= l.getPrice() %>
                </p>
                <a href="productdetails.jsp" class="btn btn-primary btn-block">
                  <i class="fa-solid fa-book pr-3"></i>Buy Now</a
                >
              </div>
              <div class="card-footer">
                <small class="text-muted">Recently Updated</small>
              </div>
            </div>
          </div>
          </a>
         <%} %>
           
        </div>
        
    
      <hr />
      <h1 class="dispaly" style="text-align: center; color: grey">For Sales</h1>
      <div class="row ">
        <div class="table-responsive">
          <table class="table">
           
            <tbody>
              <tr>
              <% for(mobileentity le:ex ){ %>
                <td style="">
                      <a href="detailservlet?id=<%= le.getProductid() %>" style="text-decoration:none; color:black;">
            
            <div class="card p-2" style=" width:300px;">
            
              <img style="height:350px;  object-fit:contain;"
                src="images/mobiles/<%= le.getDisplay_img() %>"
                alt="Mobile image"
                class="card-img-top img-fluid py-3"
              />
              <div class="card-body">
                <h5 class="card-title" style="height: 40px"><%= le.getProduct_name()%></h5>
                <%if((le.getBadge().toLowerCase()).equals("new")){ %>
                <span class="badge badge-primary mb-2 badge-pill"><%= le.getBadge() %></span>
                <%}else{ %> 
                	<span class="badge badge-success mb-2 badge-pill"><%= le.getBadge() %></span>
                <%} %>
                
                <p class="card-text">
                Price:<i class="fa-solid fa-indian-rupee-sign"></i><%= le.getPrice() %>
                </p>
                <a href="productdetails.jsp" class="btn btn-primary btn-block">
                  <i class="fa-solid fa-book pr-3"></i>Buy Now</a
                >
              </div>
              <div class="card-footer">
                <small class="text-muted">Recently Updated</small>
              </div>
            </div>
          </a>
                </td>
                 <%} %>
               
              </tr>
            </tbody>
          </table>
        </div>
      </div>
       <!-- First Row [Prosucts]-->
  <h2 class="font-weight-bold mb-2">From the Shop</h2>
  <p class="font-italic text-muted mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>

  <div class="row pb-5 mb-4">
    <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
      <!-- Card-->
      <div class="card rounded shadow-sm border-0">
        <div class="card-body p-4"><img src="https://bootstrapious.com/i/snippets/sn-cards/shoes-1_gthops.jpg" alt="" class="img-fluid d-block mx-auto mb-3">
          <h5> <a href="#" class="text-dark">Awesome product</a></h5>
          <p class="small text-muted font-italic">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          <ul class="list-inline small">
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star-o text-success"></i></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
      <!-- Card-->
      <div class="card rounded shadow-sm border-0">
        <div class="card-body p-4"><img src="https://bootstrapious.com/i/snippets/sn-cards/shoes-2_g4qame.jpg" alt="" class="img-fluid d-block mx-auto mb-3">
          <h5> <a href="#" class="text-dark">Awesome product</a></h5>
          <p class="small text-muted font-italic">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          <ul class="list-inline small">
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star-o text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star-o text-success"></i></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
      <!-- Card-->
      <div class="card rounded shadow-sm border-0">
        <div class="card-body p-4"><img src="https://bootstrapious.com/i/snippets/sn-cards/shoes-3_rk25rt.jpg" alt="" class="img-fluid d-block mx-auto mb-3">
          <h5> <a href="#" class="text-dark">Awesome product</a></h5>
          <p class="small text-muted font-italic">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          <ul class="list-inline small">
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
      <!-- Card-->
      <div class="card rounded shadow-sm border-0">
        <div class="card-body p-4"><img src="https://bootstrapious.com/i/snippets/sn-cards/shoes-4_vgfjy9.jpg" alt="" class="img-fluid d-block mx-auto mb-3">
          <h5> <a href="#" class="text-dark">Awesome product</a></h5>
          <p class="small text-muted font-italic">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          <ul class="list-inline small">
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star-o text-success"></i></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
    </main>
    
  </body>
</html>
