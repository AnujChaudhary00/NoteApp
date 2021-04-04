<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/ bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  
<style>
	.task-manager-container
	{
		display:flex;
		margin:25px;
		width:100%;
		height:100%;
		max-width:900px;
		height:500px;
	}
	
	.sidebar
	{
		display:flex;
		flex-direction:column;
		width:250px;
		height:100%;
		background:#201d1d;
		padding:42px;
		border-radius:8px 0px 0px 8px;
	}
	
	.task-list-container
	{
		background:#110f0f;
		position:relative;
		display:flex;
		flex-direction:column;
		flex-grow:1;
		padding:42px;
		border-radius:8px 0px 0px 8px;
		overflow:auto;
	}
	
	.list-menu
	{
		display:flex;
		flex-direction:column;
		margin-top:15px;
		flex-grow:1;
		overflow:auto;
	}
	
	.list-menu-item
		{
			display:flex;
			align-items:center;
			padding:10px 15px;
			border-radius:5px;
			width:100%;
			color:#5f5f5f;
			margin-bottom:5px;
		}
		
		p{
				margin:0px;
				width:100%;
		}
			
		.is-active
		{
			background-color:#101010;
			color:dark-blue;
		}
	
	.task
	{
		background:#ffffff;
		padding:15px 20px;
		margin-top:10px;
		border-radius:5px;
		transition:box-shadow .5s ease, transform .3s ease;
		user-seleect:none;
	}
	
	.task:active {
			transform:scale(.95);
		}
		
		.task:hover
		{
			box-shadow:0px 0px 5px #cccccc;
		}
	
	.task:hover
	{
		cursor:pointer;
	}
	
	.task:complete
	{
		text-decoration:line-through #000000;
		opacity:.5;
	}
		
	
	.circle-add-button
	{
		position:absolute;
		bottom:35px;
		right:35px;
		height:50px;
		width:30px;
		border:none;
		border-radius:50%;
	}
	

	.btn-rounded-corners
	{
		border-radius:25px;
	}
	
	p{
			margin:0px;
		}
		
	.task
	{
		baclground-color:#201d1d;
	}
	
	.pull-right
	{
		float:right;
	}
	
	.task-delete
	{
		padding:0 px 5 px;
	}
	
	.task-delete:hover
		{
			color:red;
		}
	
	.list-menu-item:hover
		{
			text-decoration:none;
		}
	
	
</style>
</head>
<body>

<%
		response.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
	
		if(session.getAttribute("token")==null)
		{
			response.sendRedirect("LoginSignUp.jsp");
		}
%>

	<div class="container bg-dark1">
		<nav class="navbar  navbar-expand-lg navbar-dark bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="navTab"
    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse  justify-content-between" id="navTab">
	    <ul class="navbar-nav">
	      <li class="active"><a class="nav-link" href="index.jsp">Home</a></li>
	      <li class="nav-item">
	      <div class="dropdown">
			  <button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Notifications <span class="badge badge-light">4</span> </button>
			  	<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
			    <button class="dropdown-item" type="button">Action</button>
			    <button class="dropdown-item" type="button">Another action</button>
			    <button class="dropdown-item" type="button">Something else here</button>
			  </div>
			</div>
	      </li>
	      <li class="nav-item"><a class="nav-link" href="#">Account Setting</a></li>
	    </ul>
	     <ul class="navbar-nav  my-0">
	     <%if(session.getAttribute("token")== null) {%>
	      <li class="nav-item active">
	        <a class="nav-link" href="Login">Login</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Registration</a>
	      </li>
	      <%} %>
	      
	      <%if(session.getAttribute("token")!= null) {%>
	      <li class="nav-item active">
	        <a class="nav-link" href="Logout">logout</a>
	      </li>
	      <%} %>
	     </ul>
	 </div>
		</nav>
	</div>
	<div class="centered-content d-flex justify-content-center	">
		<div class="task-manager-container">
			<div class="sidebar">
				<h4 class="title text-primary">Notebooks</h4>
				<div class="list-menu">
					<a href="#" class="list-menu-item is-active">
						<p class="white-text">
							Notebook
							<span class="pull-right task-delete btn-rounded-corners">X</span>
						</p>
					</a>
				</div>
				<button class="btn btn-primary btn-rounded-corners" >Add Notebook</button>
			</div>
			<div class="task-list-container">
				<h1 class="title has-text-primary">Notes</h1>
				<button class="btn btn-primary btn-rounded-corners ">Add Note</button>
				<div class="task">
						<p class="white-text">Name</p>
						<p>Discription</p>
						<div class="d-flex justify-content-center">
							<p class="text-secondary">Tags</p>
							<p class="text-secondary">Start date</p>
							<p class="text-secondary">End Date</p>
							<p class="text-secondary">Reminder</p>
						</div>
						<span class="pull-right task-delete btn-rounded-corners">X</span>
				</div>
			</div>
		</div>
	</div>
 
</body>
</html>