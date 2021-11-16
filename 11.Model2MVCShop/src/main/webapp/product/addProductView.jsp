<%@ page contentType="text/html; charset=euc-kr" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>상품등록</title>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
	<!-- <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
    <!-- Bootstrap Dropdown Hover JS -->
   <!-- <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
   
      <!-- jQuery UI toolTip 사용 CSS-->
  <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
  <!-- jQuery UI toolTip 사용 JS-->
  <!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
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
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        #fileName { height: 40px; }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncAddProduct(){
		//Form 유효성 검증
	 	//var name = document.detailForm.prodName.value;
		var name=$("input[name='prodName']").val();
		//var detail = document.detailForm.prodDetail.value;
		var detail=$("input[name='prodDetail']").val();
		//var manuDate = document.detailForm.manuDate.value;
		var manuDate=$("input[name='manuDate']").val();
		//var price = document.detailForm.price.value;
		var price=$("input[name='price']").val();

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

		$("form").attr("method","POST").attr("action","/product/addProduct").attr("enctype","multipart/form-data").submit();
	}
	
		function resetData(){
			document.detailForm.reset();
		}

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
	});	
		
		  $( function() {
			    $( "#datepicker" ).datepicker({
			    	dateFormat:"yy-mm-dd"
			    });
			  } );
		
	
</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	<h1 class="bg-primary text-center">상품등록</h1>
	
	<form class="form-horizontal">
	
	 <div class="form-group">
	 	<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
	<div class="col-sm-4">
	<input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
		</div>
		</div>
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    </div>
		  </div>
		

		<div class="form-group">
		    <label for="datepicker" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
			<input type="text" id="datepicker" name="manuDate" class="form-control" value="">
	</div></div>

		<div class="form-group">
		  <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-3">
		  <input type="text" name="price" class="form-control" maxLength="10">
				</div>
			<div class="center">
			<label for="price" class="control-label">원</label></div>
		</div>
<div class="form-group">
		  <label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		 <div class="col-sm-4">
			<input type="file" id="fileName" name="file" class="form-control">
</div></div>

 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >등&nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>

</form>
</div>
</body>
</html>