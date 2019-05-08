<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="dao" class="pagingtestBoard.TestDAO"/>
<jsp:useBean id="dto" class="pagingtestBoard.TestDTO"/>
<%
 String num = request.getParameter("num");
 System.out.println("request.getParameter('num') : "+num);
 int number = Integer.parseInt(num);
%>



<%
 dto = dao.context(number);
 System.out.println("dto.getFilename() : "+dto.getFilename());
 String fileName = dto.getFilename();
 String path = getServletContext().getRealPath("fileUpDown")+"\\";
 
 path+=fileName;
 
 System.out.println(path);

 File f = new File(path);
 if(f.exists()){
	 System.out.println("파일 존재하여 삭제합니다.");
	 f.delete();
 }
 
%>

<c:set var="num" value="${param.num }"/>
${dao.delete(num)}


<c:redirect url="./list.jsp?start=1"/>


</body>
</html>