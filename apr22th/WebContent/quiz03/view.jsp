<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>request.getParameterNames() 메서드 사용</h2>
<%	
	request.setCharacterEncoding("utf-8");
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String param = (String)paramEnum.nextElement();
		
		
		if(param.equals("fav")){
			String[] fav = request.getParameterValues(param);
			for (String s: fav){
				out.print(param+":"+s+"<br>");
			}
		}else{
			out.print(param+":"+request.getParameter(param)+"<br>");
		}
		
	}


%>


</body>
</html>