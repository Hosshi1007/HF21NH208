<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException"%>
<%
//文字コードの指定
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC>
	<html>
<head>
<meta http-equiv="Content-Type" content=" text/html;charset=UTF-8">
<title></title>
</head>
<body>
<h1></h1>
<form method="post" action="/HF21/servlet/imgsend2" enctype="multipart/form-data">
<div class="tr">
	<label for="logo">画像:</label>
	<div class="td">
		<input type="file" id="logo" name="logo" >
	</div>
</div>

<button type="submit">送信</button>
</form>

<br />
</body>
</html>
