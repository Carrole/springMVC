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
	<div class = "container">
		<h2>게시판 전체 내용</h2>
				<form method="post" action="searchBoardList.do">
			<table class = "table table-hover table align-middle">
				<!-- 검색 창을 위한 <tr> 구성 -->
				<tr height="40">
					<td colspan="3">
					</td>
					<td colspan="1">
						<select name="searchCon">
							<option value="title">제목</option>
							<option value="content">글 내용</option>
							<option value="users">작성자</option>
						</select>
						<input type="text" name="searchKey">
						<input type="submit" value="검색">
					</td>
				</tr>
				<tr class = "table-light" height="40">
					<td>#</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성 일시</td>
					<td>조회</td>
				</tr>
				<c:forEach items="${bList}" var="board">
					<tr height="40">
						<td>${board.seq}</td>
						<td><a href="getBoard.do?seq=${board.seq}"> ${board.title}</a></td>
						<td>${board.users}</td>
						<td>${board.created_at}</td>
						<td>${board.viewed}</td>

					</tr>
				</c:forEach>
				<button class = "btn" type = button onclick="location.href='insertBoard.do'">새글 쓰기</button>
			</table>
		</form>
	</div>
</body>
</html>