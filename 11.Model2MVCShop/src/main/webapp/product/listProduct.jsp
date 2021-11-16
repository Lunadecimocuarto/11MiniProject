<%@ page contentType="text/html; charset=euc-kr"%>

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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<style>
	  body {
            padding-top : 50px;
        }
        .prodNo{
          padding:0 !important ;
        }
    </style>
<script type="text/javascript">

		
	//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		
		$("#currentPage").val(currentPage);
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
		
	}


$(function(){

	$("td.ct_btn01:contains('검색')").on("click",function(){
		fncGetList(1);
	});

	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
	$( "td:nth-child(2)").on("click" , function() {
		
			//Debug..
			//alert(  $( this ).text().trim() );
			//클릭시 클릭되는 prodNo를 가져와야 하기 때문에 this 씀
			//그냥 prodNo로 하면 제일 처음 값만 계속 가져옴 내가 클릭한게 뭔지 알 수 없기 때문
			var prodNo=$(this).data("prodno");
			console.log(prodNo);
			//self.location ="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
			if(${param.menu.equals("search")}){
			$.ajax(
					{
						url : "/product/json/getProduct/"+prodNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"							
						},
						success : function(JSONData, status){
							console.log(JSONData);
							var displayValue="<h6>"
											+"상품번호 : "+JSONData.prodNo+"<br/>"
											+"상품명 : "+JSONData.prodName+"<br/>"
											+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
											+"제조일자 : "+JSONData.manuDate+"<br/>"
											+"가격 : "+JSONData.price+"<br/>"
											+"등록일자 : "+JSONData.regDateString+"<br/>"
											+"</h6>";
											
							//alert(JSONData.regDateString);
							
							$("h6").remove();
							$("#"+prodNo+"").html(displayValue);
						}					
					});
			}else{
				self.location ="/product/getProduct?prodNo="+prodNo+"&menu=manage";
			}
			
			$( "td:nth-child(2)").on("dblclick" , function() {
				self.location="/product/getProduct?prodNo="+prodNo+"&menu=search";
			});
	});
	
	//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
	$("h7").css("color" , "red");
	
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});

$(function(){
	
	$("a:contains('구매')").on("click" , function(){
		
		var prodNo=$(this).data("prodno");
		self.location="/addPurchaseView?prodNo="+prodNo;
	});
	
	$("a:contains('상세조회')").on("click" , function(){
		
		var prodNo=$(this).data("prodno");
		var menu=$(this).data("menu");
		$(this).attr("href" , "/product/getProduct?prodNo="+prodNo+"&menu="+menu);
	});
	
	
	$("a:contains('수정')").on("click" , function(){
		var prodNo=$(this).data("prodno");
		var menu=$(this).data("menu");
		//alert(prodNo);
		
		$(this).attr("href" , "/product/updateProduct?prodNo="+prodNo+"&menu="+menu);
	});
	
});
 
</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

<div class="page-header text-info">
	       <h3>상품목록조회</h3>
	    </div>

    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
		 			<select class="form-control" name="searchCondition" >
					<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>
					상품번호</option>
					<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>
					상품명</option>
					<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>
					가격</option>
		 			</select>
		 		</div>
		<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
		</div>
	</div>
	
<!--  table Start /////////////////////////////////////-->
			

<div class="container" style="padding-top:10px;" >
	<div class="row">
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
	 	 <div class="col-md-4">
		   	 <div align="center" class="thumbnail">
			     <div style="height: 200px; width: 200px;">  <img src="/images/uploadFiles/${product.fileName}" height="100%" width="100%"></div>
				      <div class="caption">
				        <h3>${product.prodName}</h3>
				        <p>${product.price}</p>
				        <p>${product.regDate}</p>
				        <p>
				        <c:choose>
				        <c:when test="${param.menu=='manage'}">
				       		<a href="#" class="btn btn-primary" role="button" data-prodNo="${product.prodNo}" data-menu="${param.menu}">수정</a>
				        </c:when>
						<c:otherwise>
				        	<a href="#" class="btn btn-primary" role="button" data-prodNo="${product.prodNo}" data-menu="${param.menu}">구매</a>
				        	<a href="#" class="btn btn-primary" role="button" data-prodNo="${product.prodNo}" data-menu="${param.menu}">상세조회</a>
				        </c:otherwise>
				        </c:choose></p>
	      			</div>
	    		</div>
	    	</div>
	</c:forEach>
	</div>
</div>

	


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
				
	<jsp:include page="../common/pageNavigator_new.jsp"/>
    	
    	</td>
	</tr>
		
</table>
<!--  
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
			<a href="/listProduct.do?page=1&menu=search">1</a>
		
			<a href="/listProduct.do?page=2&menu=search">2</a>
		
			<a href="/listProduct.do?page=3&menu=search">3</a>
		
			<a href="/listProduct.do?page=4&menu=search">4</a>
		
			<a href="/listProduct.do?page=5&menu=search">5</a>
		
			<a href="/listProduct.do?page=6&menu=search">6</a>
		
    	</td>
	</tr>
</table>
-->
<!--  페이지 Navigator 끝 -->
</body>
</html>
