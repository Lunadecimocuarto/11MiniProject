<%@ page contentType="text/html; charset=euc-kr" %>


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

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
	
		$("td.ct_btn01:contains('확인')").on("click",function(){
			self.location="/product/listProduct?menu=manage"
		});
	});
	
	
	</script>

</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

	<div class="page-header text-center">
	       <h3 class=" text-info">상품상세조회</h3>
	       </div>
	       
	       <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" method="post">
			<div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}" readonly>
		       <span id="helpBlock" class="help-block">
		    
			  </span>
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		<div class="col-sm-4"><input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
<		    </div>
		  </div>
		<div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">
			상품이미지<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label> <div class="col-sm-4"><input type="file" class="form-control" id="file" name="file" vlaut="${product.fileName}">
<		    </div>
		  </div>
			
		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">
			상품상세정보<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		<div class="col-sm-4"><input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
<		    </div>
		  </div>
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		<div class="col-sm-4"><input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}">
<		    </div>
		  </div>
		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		<div class="col-sm-4"><input type="text" class="form-control" id="price" name="price" value="${product.price}">
<		    </div>
		  </div>
		<div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">등록일자<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		<div class="col-sm-4"><input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate}">
<		    </div>
		  </div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"style="padding-top: 3px;">
				<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
					<a href="/product/listProduct?menu=manage">확인</a>
					////////////////////////////////////////////////////////////////////// -->
				확인</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>
</form>
 </div>
</body>
</html>