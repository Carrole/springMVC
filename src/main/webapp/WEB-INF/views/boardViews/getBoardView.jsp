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
	<div class="container">
		<h2>글 보기</h2>
		<div class = "card">
		<div class="card-body">
			<h4 class="card-title">${board.title}</h4>
			<p class ="card-subtitle mb-2 text-muted">작성자 : ${board.users} 조회수 : ${board.viewed}</p>
			<p class="card-text">${board.content}</p>
		</div>
		</div>
		<table>
			<tr height="50">
				<td>
				<button type="button" class="btn btn-light"
						onclick="location.href='modifyBoard.do?seq=${board.seq}'">수정</button>
					<button class = "btn btn-light"
					type="button"
							onclick="location.href='deleteBoard.do?seq=${board.seq}'">삭제</button>
					<button
					type="button" class ="btn btn-secondary"
					onclick="location.href='getBoardList.do'">목록</button></td>
			</tr>
		</table>
		<h4>댓글</h4>
		<hr>
		<form action="/insertComment.do" method="get">
			<input class="d-none" name="post_id" value="${board.seq}" />
			<textarea class="form-control" rows="3" name="content"></textarea>
			<button class = "btn btn-secondary" type="submit">댓글 작성</button>
		</form>
		<table class = "table align-middle">

		<c:choose>
			<c:when test="${message eq 'success'}">
				<c:forEach items="${clist}" var="comment">
					<tr>
						<td>익명</td>
						<td>${comment.content}</td>
						<td>${comment.created_at}</td>
						<td><button class="btn btn-secondary" type="button" onclick="location.href='deleteComment.do?seq=${comment.seq}'">X</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td><p>아직 댓글이 없습니다.</p></td>
				</tr>
			</c:otherwise>
		</c:choose>

		</table>


	</div>
</body>
</html>