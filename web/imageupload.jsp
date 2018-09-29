
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <img src="https://res.cloudinary.com/dpuvc8lvh/image/upload/v1536309965/lpmolobxciedtp9st3nx.jpg"/>
        
        <h1>Upload An Image</h1>
        
        <form action="ImageUpload" method="post" enctype="multipart/form-data">
            <input type="file" name="myfile"/>
            <br>
            <input type="submit" value="Upload"/>
            
        </form>
        
    </body>
</html>
