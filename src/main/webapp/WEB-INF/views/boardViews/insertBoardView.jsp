<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>글 쓰기</h2>
		<form action="insertProcBoard.do" method="get">
			<label class="form-label">글 제목</label>
			<input type="text" class="form-control" name="title">

			<label class="form-label">닉네임</label>
			<input type="text" class="form-control" name="users">

			<label class="form-label">글 내용</label>
			<textarea class="form-control" type="text" name="content" rows="3"></textarea>

						<input type="submit" value="저장" />
						<input type="reset" value="취소" />
		</form>
	</div>
</body>
</html>