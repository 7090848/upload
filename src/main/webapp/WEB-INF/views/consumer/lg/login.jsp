<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../../resources/css/common.css">
<style type="text/css">


</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row my-5"></div>
		
		<div class="row mx-3">
			<div class="col">
			
				<div class="row mb-3">
					<div class="col-1"></div>
					<div class="col border-bottom border-top border-secondary border-opacity-25 text-center py-2">
					
						<div class="row">
							<div class="col">
								<span class="text-warning opacity-50 fw-bold">W</span><span class="text-secondary">e</span>&nbsp;
								<span class="text-warning opacity-50 fw-bold">H</span><span class="text-secondary">and</span>&nbsp;
								<span class="text-warning opacity-50 fw-bold">M</span><span class="text-secondary">ade</span>
							</div>
						</div>
						
					</div>	
					<div class="col-1"></div>				
				</div>
				
				
				<div class="row pt-3">
					<div class="col px-0">
						
						<div class="row" style="width: 230px; margin: 0 auto;">
							<div class="col"><img class="img-fluid" src="../../resources/img/logoA.png"></div>
						</div>
						<div class="row">
							<div class="col">
								<form action="../lg/loginProcess" method="post"><br>
									<div class="row my-2"><div class="col"><input class="form-control py-1" type="text" name="consumer_id" placeholder="아이디"></div></div>
									<div class="row my-2"><div class="col"><input class="form-control py-1" type="password" name="consumer_pw" placeholder="비밀번호"></div></div>
									<div class="row my-2"><div class="col d-grid"><button class="btn btn-warning text-light">로그인</button></div></div>
								</form>
							</div>
						</div>
						
					
					</div>
				</div>
				
				<div class="row text-center">
					<div class="col">
					
						<div class="row my-2 border-top border-bottom border-2 border-opacity-25 border-warning">
							<div class="col py-1"><a class="text-decoration-none text-warning">회원가입</a></div>
						</div>
						
						<div class="row my-3">
							<div class="col px-0"><a class="text-decoration-none text-secondary opacity-75">아이디/비밀번호를 잊어버리셧나요?</a></div>
						</div>
					</div>
				</div>
			</div>
					
		</div>
		
		
		</div>
	</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>