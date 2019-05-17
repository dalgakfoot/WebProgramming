<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<header>
<jsp:include page="./header.jsp"/>
</header>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="dao" class="board.totoDAO"/>
<c:set var="dto" value="${dao.contentView(param.id,param.chk)}"/>
<div align="center">
<form action="modify.jsp" method="post">
	<input type="hidden" name="id" value="${dto.id }">

	<table border="1">	
			<tr>
				<td>번호</td><td>${dto.id }</td>
			</tr>
			<tr>
				<td>조회수</td><td>${dto.hit }</td>
			</tr>
			<tr>
				<td>등록자</td>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<td colspan="2">
				<!-- 해당 세션과 아이디가 일치하면 수정기능 -->
				<c:if test="${param.userId eq sessionScope.userid}">
					<input type="button" value="수정" onclick="location.href='modifyView.jsp?id=${dto.id}'"> &nbsp;&nbsp;
				</c:if>		
				<a href="list.jsp">목록보기</a>&nbsp;&nbsp;	
				<!-- 해당 세션과 아이디가 일치하면 삭제기능 -->
				<c:if test="${sessionScope.userid eq param.userId || sessionScope.userid eq 'Manager'}">
					<a href="delete.jsp?id=${dto.id}">삭제</a> &nbsp;&nbsp;
				</c:if>	
				</td>
			</tr>
		
	</table>
</form>		
	<c:import url="reply.jsp?id=${dto.id}"/>	<!-- 댓글내용 -->
	
	
	
	
			 <form action="reply" method="get">
	<table border="1">	
           <tr>
               <!-- 아이디-->
               <td width="150">
                   ${sessionScope.userid}
               </td>
               <!-- 본문 작성-->             
               <td width="550">
              	 <input type="hidden" name="id" value="${dto.id}">
              	 <input type="hidden" name="replyId" value="${sessionScope.userid }">
              	 <input type="hidden" name="userId" value="${param.userId}">
                 <textarea name="content" rows="4" cols="70" ></textarea>                                        
               </td>
               <!-- 댓글 등록 버튼 -->
               <td width="100">
                   <div style="text-align:center;">
                       <p><input type="submit" value="댓글달기"></p>    
                   </div>
               </td>
           </tr>    	 	  
  	</table>
  			</form>   
	
</div>
<footer>
	<jsp:include page="./footer.jsp"/>
	</footer>
</body>
</html>