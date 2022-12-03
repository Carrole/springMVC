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
<script type="text/javascript">
	const user = "sol";
	localStorage.setItem("currentUser", user);
</script>
<body>
	<div class = "container">
		<h2>익명 커뮤니티</h2>
				<form method="post" action="searchBoardList.do">
			<table class = "table table-hover table align-middle">
						<div><select name="searchCon">
							<option value="title">제목</option>
							<option value="content">글 내용</option>
							<option value="users">작성자</option>
						</select>
						<input type="text" name="searchKey">
						<input type="submit" value="검색">
						</div>
				<tr class = "table-light">
					<td>#</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성 일시</td>
					<td>조회</td>
				</tr>
				<c:forEach items="${bList}" var="board">
					<tr>
						<td>${board.seq}</td>
						<td><a href="getBoard.do?seq=${board.seq}&viewed=${board.viewed}"> ${board.title}</a></td>
						<td>${board.users}</td>
						<td>${board.created_at}</td>
						<td>${board.viewed}</td>

					</tr>
				</c:forEach>
				<button class = "btn btn-light" type = "button" onclick="location.href='insertBoard.do'">새글 쓰기</button>
			</table>
		</form>
	</div>
</body>
</html>