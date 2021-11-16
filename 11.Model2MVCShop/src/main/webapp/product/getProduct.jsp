<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
 

<script type="text/javascript">

	$(function(){
		
		$("td.ct_btn01:contains('이전')").on("click",function(){
			history.go(-1);
		});
		
		$("td.ct_btn01:contains('구매')").on("click",function(){
			self.location="/addPurchaseView?prod_no=${product.prodNo}"
		});
	})
	
	

</script>

</head>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

<form method="post">

 		<div class="page-header">
	       <h3 class=" text-info">상품상세조회</h3>
	     </div>
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>	상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div></div>
			<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodName}</div></div>
		<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>
			상품이미지 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</strong></div>
		<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}"/>	
		</div></div>
		<hr/>
		<div class="row">
		<div class="col-xs-4 col-md-2"><strong>
		상품상세정보</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodDetail}</div></div>
		<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
		<div class="col-xs-8 col-md-4">${product.manuDate}</div></div>
		<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
		<div class="col-xs-8 col-md-4">${product.price}</div></div>
		<hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
		<div class="col-xs-8 col-md-4">${product.regDate}</div></div>
		<hr/>


<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
				구매</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
				이전</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>
</form>

</body>
</html>