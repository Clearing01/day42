<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.BoardVO,java.util.ArrayList" %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<script type="text/javascript">
	function check(){
		ans=prompt('비밀번호를 입력하세요.');
		if(ans==<%=member.getMpw()%>){
			location.href="controller.jsp?action=mypage";
		}
	}
</script>
<h1><a href="javascript:check()"><%=member.getMname()%></a>님, 반갑습니다!</h1>
<table border="2">
	<tr>
		<th>번 호</th><th>제 목</th><th>작성자</th>
	</tr>
<%
	for(BoardVO v:(ArrayList<BoardVO>)datas){
%>
	<tr>
		<th><a href="controller.jsp?action=board&bid=<%=v.getBid()%>"><%=v.getBid()%></a></th>
		<td><%=v.getTitle()%></td>
		<td><%=v.getWriter()%></td>
	</tr>
<%
	}
%>
</table>
<hr>
<form action="controller.jsp">
	<input type="hidden" name="action" value="search">
	<input type="text" name="text">
	<select name="cate">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>
	<input type="submit" value="검색">
</form>
<br>
<a href="form.jsp">새로운 글 작성하기</a> <br><br> 
<a href="controller.jsp?action=logout">로그아웃</a>

</body>
</html>