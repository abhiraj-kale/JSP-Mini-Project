<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" >
    <title>Shorten URL</title>
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="shortcut icon" href="/public/favicon.jpg">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
</head>
<style>
    .container-fluid{
        height: 100vh;
    }
    .main{
        height: 60vh;
        width: 80vh;
        align-self: center;
    }
    .copy{
        height: 15vh;
    }
</style>
<body>

	
	    <div class="container-fluid d-flex justify-content-center">
	        <div class=" main d-flex flex-column">
	            <div class="d-flex justify-content-center">
	                <h1>URL Shortener</h1>
	            </div>
	            
	            <form method="post" action="process.jsp"  class=" main d-flex flex-column">
	            <input required name="url_field" type="url" id="link" class="text-center" placeholder="Enter the URL">
	            <br>
	            <input type="submit" id='get-link-btn' class="btn btn-success" value="Generate URL"  />    	
    			</form> 
    			
	        	<%
	        	String id = request.getParameter("id");
	        	if(id!=null && !id.trim().isEmpty()){
	        		%> 
	        	<div class=" lbl-div d-flex justify-content-around text-primary" >
                <label class="lbl" id="lbl" style="display: none;">The URL has been shortened below</label>
            	</div>

                    <input value="http://localhost:8080/JSP/short.jsp?id=<%= id %>" type="text" id="copy-lbl" class="copy-lbl text-center" readonly >
                    <button id="copy-btn" onclick="copyText()" class="copy-btn btn btn-success" >Copy</button>  
                  
	        		<%
	        	}
	        	%>
	        	
	        </div>
	    </div>
    
    <script type="text/javascript">
    function copyText(){
        var dummy = document.createElement('input'),
        text = document.getElementById("copy-lbl").value;
        document.body.appendChild(dummy);
        dummy.value = text;
        dummy.select();
        document.execCommand('copy');
        document.body.removeChild(dummy);
        alert('Link copied!');
	}
    </script>
</body>
</html>