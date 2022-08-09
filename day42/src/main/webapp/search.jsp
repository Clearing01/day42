<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.BoardVO,java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="2">
	<tr>
		<th>제 목</th><th>내 용</th><th>작성자</th>
	</tr>
<%	
	if(datas.size()==0){
		out.println("<h1>검색하신 게시글이 존재하지 않습니다...</h1>");
	}
	else {
		for(BoardVO v:(ArrayList<BoardVO>)datas){
%>
		<tr>
			<th><%=v.getTitle()%></th>
			<td><%=v.getContent()%></td>
			<td><%=v.getWriter()%></td>
		</tr>
<%
		}
	}
%>
</table>
<hr>
<a href="controller.jsp?action=main">메인으로 돌아가기</a>

</body>
</html>