<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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

		
	//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿� 
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		
		$("#currentPage").val(currentPage);
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
		
	}


$(function(){

	$("td.ct_btn01:contains('�˻�')").on("click",function(){
		fncGetList(1);
	});

	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
	$( "td:nth-child(2)").on("click" , function() {
		
			//Debug..
			//alert(  $( this ).text().trim() );
			//Ŭ���� Ŭ���Ǵ� prodNo�� �����;� �ϱ� ������ this ��
			//�׳� prodNo�� �ϸ� ���� ó�� ���� ��� ������ ���� Ŭ���Ѱ� ���� �� �� ���� ����
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
											+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
											+"��ǰ�� : "+JSONData.prodName+"<br/>"
											+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
											+"�������� : "+JSONData.manuDate+"<br/>"
											+"���� : "+JSONData.price+"<br/>"
											+"������� : "+JSONData.regDateString+"<br/>"
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
	
	//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
	$("h7").css("color" , "red");
	
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});

$(function(){
	
	$("a:contains('����')").on("click" , function(){
		
		var prodNo=$(this).data("prodno");
		self.location="/addPurchaseView?prodNo="+prodNo;
	});
	
	$("a:contains('����ȸ')").on("click" , function(){
		
		var prodNo=$(this).data("prodno");
		var menu=$(this).data("menu");
		$(this).attr("href" , "/product/getProduct?prodNo="+prodNo+"&menu="+menu);
	});
	
	
	$("a:contains('����')").on("click" , function(){
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
	       <h3>��ǰ�����ȸ</h3>
	    </div>

    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
		 			<select class="form-control" name="searchCondition" >
					<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>
					��ǰ��ȣ</option>
					<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>
					��ǰ��</option>
					<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>
					����</option>
		 			</select>
		 		</div>
		<div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
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
				       		<a href="#" class="btn btn-primary" role="button" data-prodNo="${product.prodNo}" data-menu="${param.menu}">����</a>
				        </c:when>
						<c:otherwise>
				        	<a href="#" class="btn btn-primary" role="button" data-prodNo="${product.prodNo}" data-menu="${param.menu}">����</a>
				        	<a href="#" class="btn btn-primary" role="button" data-prodNo="${product.prodNo}" data-menu="${param.menu}">����ȸ</a>
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
<!--  ������ Navigator �� -->
</body>
</html>
