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
   
     <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
        
         #fileName { height: 40px; }
    </style>
    
 <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
<!--
function fncAddProduct(){
	//Form 유효성 검증
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
		
	$("form").attr("method","POST").attr("action","/product/updateProduct").attr("enctype","multipart/form-data").submit();
}
-->
	//"등록" event 연결
	$(function(){

	$("button.btn.btn-primary").on("click",function(){
		fncAddProduct();
	});
});
	
	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
	});
		
		$("a[href='#' ]").on("dblclick" , function(e) {
			e.preventDefault();
		//	history.go(-1);
		window.history.go(-2);
	});
});	

$( function() {
	    $( "#datepicker" ).datepicker({
	    	dateFormat:"yy-mm-dd"
	    });
	  } );


</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	  <div class="page-header text-center">
	       <h3 class=" text-info">상품정보수정</h3>
	  </div>
	  
	  <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" method="post" name="detailForm">
			<input type="hidden" name="prodNo" value="${product.prodNo}"/>

	<div class="form-group">
		  <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">
			상품명</label>
	  <div class="col-sm-4">
	  <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		</div>
		  </div>
	<div class="form-group">
		   <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">
			상품상세정보 </label>
	  <div class="col-sm-4">
	  <input type="text" class="form-control" id="prodDetail"  name="prodDetail" value="${product.prodDetail}">
		</div>
		  </div>
	<div class="form-group">
		    <label for="datepicker" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
			<input type="text" id="datepicker" name="manuDate" class="form-control" value="${product.manuDate}">
	</div></div>
	
		<div class="form-group">
		  <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
			<input type="text" id="price" name="price" class="form-control" value="${product.price}">
	</div></div>
	<div class="form-group">
		  <label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
	<div class="col-sm-4">
			<input type="file" id="fileName" name="file" class="form-control" value="${product.fileName}">
	</div></div>

 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >수&nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>

</form>
</div>

</body>
</html>