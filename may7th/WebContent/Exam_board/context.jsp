<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{width:70%;}
#container{text-align: center;}
</style>
</head>
<body>
<header>
<jsp:include page="../Exam_default/header_loginsuc.jsp"/>
</header>
<!-- 제목 클릭시 보여지는 글의 내용  -->
<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="pagingtestBoard.TestDAO"/>
	
	
	<c:set var="dto" value="${dao.context(param.num) }"/>
	${dao.count(param.num) }
<div id="container">
<div>
<table border=1>
	<tr>
	<th>작성자</th><th>${dto.id }</th>
	<th>조회수</th><th>${dto.count }</th>
	</tr>
	<tr>
	<th>작성일</th><th>${dto.pdate }</th>
	<th>다운로드</th><th>${dto.filename }</th>
	<tr>
	<tr>
	<th>제목</th><th colspan="3">${dto.title }</th>
	</tr>
	<tr>
	<th>문서내용</th><th colspan="3">${dto.content }</th>
	</tr>
	<tr>
	<td colspan="4" align="left">
	<button>목록</button><button>수정</button><button>삭제</button>
	</td>

</table>
</div>
</div>

<footer>
	<jsp:include page="../Exam_default/footer.jsp"/>
	</footer>

</body>
</html>