<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	</head>
<body>
	<center>
		<h2>게시판 전체 내용</h2>
		<button class = "btn btn-primary"><a href="insertBoard.do">글 쓰기</a></button>
		<form method="post" action="searchBoardList.do">
			<table border="1">
				<!-- 검색 창을 위한 <tr> 구성 -->
				<tr height="40" bgcolor="yellow">
					<td colspan="4" align="right">
						<select name="searchCon">
							<option value="title">제목</option>
							<option value="content">글 내용</option>
							<option value="user">작성자</option>
						</select>
						<input type="text" name="searchKey">
						<input type="submit" value="검색">
					</td>
				</tr>
				<tr height="40">
					<td width="150" align="center">번호</td>
					<td width="150" align="center">제목</td>
					<td width="150" align="center">작성자</td>
					<td width="150" align="center">글 내용</td>
					<td width="150" align="center">작성 일시</td>
					<td width="150" align="center">조회수</td>
				</tr>
				<c:forEach items="${bList}" var="board">
					<tr height="40">
						<td width="150" align="center">${board.seq}</td>
						<td width="150" align="center"><a href="getBoard.do?seq=${board.seq}"> ${board.title} </a></td>
						<td width="150" align="center">${board.writer}</td>
						<td width="150" align="center">${board.content}</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</center>
</body>
</html>