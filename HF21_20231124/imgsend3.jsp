<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException"%>
<%
//文字コードの指定
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String path = "C:/Users/user/Downloads/kidmox/Python_train/practice/python/data/dst/opencv_mosaic_face.jpg";

String showimg = request.getAttribute("filename").toString();


%>
<!DOCTYPE html PUBLIC>
<html>
<img src="/HF21/image/mosaic/<%= showimg %>">
</html>