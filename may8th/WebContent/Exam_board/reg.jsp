<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dto" class="pagingtestBoard.TestDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id ="dao" class="pagingtestBoard.TestDAO"/>


${dao.insert(dto) }

<form name="upload" action="FileUpLoad" method="post" enctype="multipart/form-data">
	<input type="hidden" name="file" value="${dto.filename}">
</form>
<script>
document.upload.submit();
</script>
<c:redirect url ="list.jsp?start=1"/>

</body>
</html>