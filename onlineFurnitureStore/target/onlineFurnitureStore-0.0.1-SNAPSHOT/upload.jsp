<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Image URL </title>
</head>
<body>
	<form method="POST" action=<%=response.encodeURL("UploadController?action=uploadNow")%>
		enctype="multipart/form-data">
		File: <input type="file" name="file" id="file" /> <br />
		 <input type="submit" value="Upload" name="upload" id="upload" />
		<!-- This is the place where you want to upload file. On web browser enter specified path where you want to copy file -->
	</form>
</body>
</html>