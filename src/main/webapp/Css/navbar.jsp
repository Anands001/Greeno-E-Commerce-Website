
    

  <nav
      class="navbar navbar-expand-lg navbar-dark"
      style="background-color: rgb(152, 251, 152); color: whitesmoke"
    >
      <a class="navbar-brand" href="#">Greeno</a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <form class="form-inline my-2 my-lg-0" style="margin-left: 500px">
          <input
            class="form-control mr-sm-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
            style="width: 500px"
          />
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
            Search
          </button>
        </form>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="home.jsp"
              >Home <span class="sr-only">(current)</span></a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">Link</a>
          </li>
          <li class="nav-item">
          <a href="ViewCart?username=<%= session.getAttribute("username") %>">
          <i class="fa-solid fa-cart-shopping nav-link fa-2xl mt-2" style="align-content:center;"></i>
          </a>
          </li>
          <% if(session.getAttribute("username")!=null){ %>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <%= session.getAttribute("username") %>
            
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="profile.jsp">View profile</a>
              <a class="dropdown-item" href="changepassword.jsp">Change password</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="btn btn-success" href="logout"><i class="fa-solid fa-right-from-bracket"></i> Log out</a>
          </li>
        
        <% }else{ %>
        
        <li class="nav-item">
            <a class="btn btn-success" href="login.jsp"><i class="fa-solid fa-arrow-right-to-bracket"></i> Log In</a>
          </li>
        <li class="nav-item pl-1">
            <a class="btn btn-success" href="signup.jsp"><i class="fa-solid fa-user-plus"></i> Register</a>
          </li>
        </ul>
        <% } %>
      </div>
    </nav>
