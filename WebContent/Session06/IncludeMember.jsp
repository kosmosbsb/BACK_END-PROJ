<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>IncludeMember.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="../Styles/divLayout.css" type="text/css" />
    
    <style>
		body {
		  padding-top: 70px;
		  padding-bottom: 30px;
		}		
		table,table th{
			text-align: center;
		}
		
	</style>
</head>
<body>
    <div class="container">
		<div class="page-header">
  			<h2>회원가입</h2>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form action="IncludeMemberComplete.jsp" name="frmObj" method="post"> 
					<table class="table table-bordered table-striped table-hover">
						<tr>
							<td width="30%">아이디</td>
							<td>
								<input type="text" name="id" size="20" style="width: 100%" />
							</td>
						</tr>
							<tr>
							<td width="30%">이름</td>
							<td>
								<input type="text" name="name" size="20" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td width="30%">비밀번호</td>
							<td>
								<input type="password" name="pwd" size="20" style="width: 100%"/>
							</td>
						</tr>
						<tr>
							<td width="30%">비밀번호확인</td>
							<td>
								<input type="password" name="pwd2" id="pwd2" size="20"  style="width: 100%"/>
							</td>
						</tr>
						<tr>
							<td width="30%">성별</td>
							<td>
								<label class="radio-inline">
								<input type="radio" name="gender" value="man" />남
								</label>
								<label class="radio-inline">
					            <input type="radio" name="gender" value="woman" />녀
					            </label>
					            <label class="radio-inline">
					            <input type="radio" name="gender" value="trans" />트랜스젠더
					            </label>
							</td>
						</tr>
						<tr>
							<td width="30%">관심사항</td>
							<td>
								<label class="checkbox-inline">
								<input type="checkbox" name="inter" value="pol" />정치
								</label>
								<label class="checkbox-inline">
					            <input type="checkbox" name="inter" value="eco" />경제
					            </label>
					            <label class="checkbox-inline">
					            <input type="checkbox" name="inter" value="spo" />스포츠
					            </label>
					            <label class="checkbox-inline">
					            <input type="checkbox" name="inter" value="ent" />연예
					            </label>
							</td>
						</tr>
						<tr>
							<td width="30%">학력사항</td>
							<td>
								 <select name="grade" class="form-control">
					             	<option value="">==학력을 선택하세요==</option>
					                <option value="ele">초등학교</option>
					                <option value="mid">중학교</option>
					                <option value="hig">고등학교</option>
					                <option value="uni">대학교</option>
					             </select>
							</td>
						</tr>
						<tr>
							<td colspan="2">자기소개</td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="self" class="form-control" rows="10"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit" class="btn btn-primary">등록</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
    </div> <!-- /container --> 

</body>
</html>
