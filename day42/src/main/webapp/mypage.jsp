<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.vo.MemberVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>

<div id="result"></div>
<form name="mForm" action="controller.jsp" method="post">
	<input type="hidden" name="action" value="memberUpdate">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" value="<%=data.getMid()%>" required readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" id="mpw" value="" required></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" onchange="check()" name="mpwCheck" id="mpwCheck" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="mname" value="<%=data.getMname()%>" required></td>
		</tr>
		<tr>
			<td>계정권한</td>
			<td><%=data.getRole()%></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="변경하기" onClick="revise()">&nbsp;<input type="button" value="삭제하기" onClick="del()">
			</td>
		</tr>
	</table>
</form>
<hr>
<a href="controller.jsp?action=main">메인으로 돌아가기</a> <br><br>

<script type="text/javascript">
	function del(){
		ans=confirm('정말 삭제할까요?');
		if(ans==true){
			var pw = prompt('비밀번호를 입력하세요');
			if(pw==<%=data.getMpw()%>){
			document.mForm.action.value="memberDelete";
			document.mForm.submit();
			}
			else {
				alert('비밀번호가 다릅니다...');
			}
		}
		else{
			location.href="controller.jsp?action=mypage";
		}
	}
	
	function revise(){
		var mpw=document.getElementById('mpw').value;
		var mpwCheck=document.getElementById('mpwCheck').value;
		if(mpw==mpwCheck){
			document.mForm.submit();
		}
		else{
			alert('비밀번호가 다릅니다...');
			return false;
		}
	}
	
	function check()  {
		var mpw=document.getElementById('mpw').value;
		var mpwCheck=document.getElementById('mpwCheck').value;
		if(mpw!=mpwCheck){
			document.getElementById("result").innerText = "비밀번호가 다릅니다";
			return false;
		}
		else {
			document.getElementById("result").innerText = "";	
		}
		  
	}
</script>

</body>
</html>