<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/ bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  
  <style>
  
  body
  {
  	background-color:black;
  }

  	.navbar-nav
  	{
  		display:flex;
  		flex-direction:row;
  		justify-content:space-between;
  		align-item:center;

  	}
  	li,a
  	{
  		margin-left:20px;
  		color:black;
  		font-weight:bold;
  	}
  	
  	a:hover
  	{
  		color:grey;
  	}
  	.jumbotron
  	{
  		color:white;
  		background-color:black;
  		border-radius:0px;
  	}
  	
  	.card-body
  	{
  		color:white;
  	}
  	
  	
  </style>
</head>
<body>



<nav class="navbar  navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid cont">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">KeepAndRemind</a>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="navTab"
    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse  justify-content-between" id="navTab">
	    <ul class="navbar-nav">
	      <li class="active"><a class="nav-link" href="#">Home</a></li>
	      <li class="nav-item"><a class="nav-link" href="#">Features</a></li>
	      <li class="nav-item"><a class="nav-link" href="#">About us</a></li>
	      <li class="nav-item"><a class="nav-link" href="#">Join Us</a></li>
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
  </div>
</nav>
  
<div class="jumbotron text-center">
  	<h1>Welcome to KeepAndRemind</h3>
 	<p>make notes and let the rest on us</p>
</div>
<div class="container">
	<div class="row">
  <div class="col-sm-4">
    <div class="card bg-dark">
      <div class="card-body">
        <h5 class="card-title">Manage Notebook</h5>
        <p class="card-text">Manage your notebooks here. You can create, add, delete, edit and even set reminder for ever notes.</p>
        <a href="Notebook.jsp" class="btn btn-secondary">Go To Notebooks</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card bg-dark">
      <div class="card-body">
        <h5 class="card-title">Account Setting</h5>
        <p class="card-text">
        	Manage your account setting here. Edit basic details and credentials. 
        </p>
        <a href="#" class="btn btn-secondary">Go To Account</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card bg-dark">
      <div class="card-body">
        <h5 class="card-title">Reminder</h5>
        <p class="card-text">Manage your reminder here. Set, reset or delete reminders on notes.</p>
        <a href="#" class="btn btn-secondary">Go To reminder</a>
      </div>
    </div>
  </div>
</div> 
</div>

</body>
</html>
