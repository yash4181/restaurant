<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <body style="margin: auto; width: 80%;">
        <div id="register">
        <h1>Category:</h1>
    
        <form action="RegisterCat" method="post">
            
            <h3>Name:</h3>
            <input type="text" name="name" class="form-control" required>
            
            <h3>Description:</h3>
            <input type="description" name="description" class="form-control" required>
            
            <br>
            
            <a href="AddProduct.jsp"><input type="submit" value="Submit" class="btn btn-lg btn-success"></a>
                       
        </form>
        </div>
    </body>
</html>

