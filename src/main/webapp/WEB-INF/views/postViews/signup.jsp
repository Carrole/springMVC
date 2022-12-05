<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join Syntax Sugar!</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        body {
            height: 100%;
            min-height: 100vh;
            display: flex;

            background-color: rgb(53, 63, 79);
        }

        .input-form {
            max-width: 680px;

            margin-top: 80px;
            padding: 32px;

            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
        .btn {
            background-color: rgb(53, 63, 79) !important;
        }

        .btn-primary {
            border: none !important;
        }
        a {
            color: white !important;
        }
    </style>
</head>

<body class="justify-content-center text-left">
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <c:if test="${message eq 'already exists'}" >
                <div class="alert alert-danger" role="alert">
                    중복된 닉네임입니다. 다른 닉네임으로 회원가입 해주세요.
                </div>
            </c:if>


            <h4 class="mb-3">회원가입</h4>
            <form class="validation-form" novalidate action="/signupProc.do" method="get">
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label for="nickname">닉네임</label>
                        <input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임" required>
                        <div class="invalid-feedback">
                            닉네임을 입력해주세요.
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="password">비밀번호</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" minlength="8" required>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8 mb-3">
                        <label for="root">가입 경로</label>
                        <select class="form-select custom-select d-block w-100" id="root">
                            <option value=""></option>
                            <option>검색</option>
                            <option>카페</option>
                        </select>
                        <div class="invalid-feedback">
                            가입 경로를 선택해주세요.
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="code">추천인 코드</label>
                        <input type="text" class="form-control" id="code" placeholder="">
                        <div class="invalid-feedback">
                            추천인 코드를 입력해주세요.
                        </div>
                    </div>
                </div>
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="agreement" required>
                    <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
                </div>
                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block float-end" type="submit">가입 완료</button>
            </form>
        </div>
    </div>
    <div class="text-center">
        <a class="mt-3 tex" href="/login.do"> >> 뒤로 가기 </a>
    </div>
    <footer class="my-3 text-center text-small">
<%--        <p class="mb-1">&copy; 2021 YD</p>--%>
    </footer>
</div>
<script>
    window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    }, false);
</script>
</body>

</html>