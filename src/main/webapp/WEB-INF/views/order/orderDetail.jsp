<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script> -->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
<style> .centeringContainer { text-align: center; } .centered { display: table; margin-left: auto; margin-right: auto; display: inline-block; } </style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<!-- Page Content-->
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
        <!-- Page Content-->
        <section class="py-5">
            <div class="container centeringContainer">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    Item
                    <small>${detail.title}</small>
                </h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">Item</li>
                </ol>
                <!-- Portfolio Item Row-->
	                  
		                
                <div class="row">
                    <div class="col-md-8"><img class="card-img-top" src="https://mybuckets3s3.s3.ap-northeast-2.amazonaws.com/${detail.representative_file}" alt="no image" /></div>
                    <div class="col-md-4">
                        <h3 class="my-3">${detail.title}</h3>
                       
                         <div class="col-lg-8 mb-4">
                   <%--  <form role="form" method="post">
						<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					
					</form> --%>
					<form id="orderForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="userId" value="${member.ID}" />
						<input type="hidden" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" />
						<input type="hidden" name="gdsPrice" value="${detail.gdsPrice}" />
						<input type="hidden" id="gdsStock" name="gdsStock" />
					
				<div class="goods">
					<div class="goodsImg">
						<img src="${view.gdsImg}">
					</div>
					
					<div class="goodsInfo">
						<table class="table table-sm">
							<thead>
							</thead>
							<tbody>
								<tr>
									<th scope="row">?????????</th>
									<td>${detail.gdsName}</td>
								</tr>
								<tr>
									<th scope="row">??????</th>
									<td><fmt:formatNumber pattern="###,###,###" value="${detail.gdsPrice}" /> ???</td>
								</tr>
								<tr>
									<th scope="row">??????</th>
									<td></span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsStock}" /> EA</td>
								</tr>
								<tr>
									<th scope="row">Total Price</th>
									<td></span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsStock}" /> EA</td>
								</tr>
								<tr>
									<th scope="row">?????? ??????</th>
									<td>
										<c:if test="${view.gdsStock != 0}">
											<p class="cartStock">
												<button type="button" class="plus">+</button>
												<input type="number" id="stock" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
												<button type="button" class="minus">-</button>
												<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" /> 
											</p>
											<p class="addToCart">
												<button type="button" class="addCart_btn">????????? ??????</button>
											</p>
										</c:if>
										<c:if test="${view.gdsStock == 0}">
											<p>?????? ????????? ???????????????.</p>						
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					<!-- @@@@@@@@@ -->
					
						<p class="gdsName"><span>?????????</span>${detail.gdsName}</p>
						
						<p class="gdsPrice">
							<span>?????? </span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsPrice}" /> ???
						</p>
						
						<p class="gdsStock">
							<span>?????? </span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsStock}" /> EA
						</p>
						
						<c:if test="${view.gdsStock != 0}">
						
						<p class="cartStock">
							<span>?????? ??????</span>
							<button type="button" class="plus">+</button>
							<input type="number" id="stock" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
							<button type="button" class="minus">-</button>
							<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" /> 
							
													
							
						</p>
						
						<p class="addToCart">
							<button type="button" class="addCart_btn">????????? ??????</button>
							
						</p>
						
						</c:if>
						
						<c:if test="${view.gdsStock == 0}">
							<p>?????? ????????? ???????????????.</p>						
						</c:if>
					</div>
					
					<div class="gdsDes">${view.gdsDes}</div>
				</div>
			</form>
	                    </div>
		                    <!-- @@@@@@@@@@ -->
		                    <!-- @@@@@@@@@@ -->
		                   
	                        
		                    <div class="row">
								<button class="btn btn-primary" id="orderBtn" type="button">Order</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="submit">Cart</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="submit">Wish List</button>
							</div>
							<br>
							<br>
	                        <h3 class="my-3">Project Details</h3>
	                        <ul>
	                            <li>${detail.gdsDes}</li>
	                            <li>Lorem Ipsum</li>
	                            <li>Dolor Sit Amet</li>
	                            <li>Consectetur</li>
	                            <li>Adipiscing Elit</li>
	                        </ul>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
                    </div>
                    <div class="centered">
<!-- <span class="centered"> <span class="item" style="display:block">block item</span> </span> -->
                    <h3 class="my-3">Project Details</h3>
	                        <ul>
	                        <c:forEach var="result" items="${imgList}" varStatus="status">
					            	<li><img class="card-img-top" src="<c:url value='/img/${result.file}'/>" alt="no image" /></li>
							</c:forEach>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        <!-- Related Projects Section-->
        <section class="py-5 bg-light">
            <div class="container">
                <h2 class="mb-4">Related Projects</h2>
                
                <div class="row">
                	<c:forEach var="result" items="${list}" varStatus="status">
	                   
	                <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="card-img-top" src="<c:url value='/img/${result.file}'/>" alt="no image" /></a>
                    </div>
                	</c:forEach>
                </div>
                
                <!-- <div class="row">
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                </div> -->
            </div>
        </section>
        

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>

<script>
$(document).ready(function(){              
	//$('#gdsStock').val($(".numBox").val());
});

function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/boardList.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_detail(no){
	//var  formData= $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	$('#boardForm #no').val(no);
	
	$('#boardForm').attr({
		action : '<c:url value="/boardDetail.do" />',
		target : '_self'
	}).submit();

}

function fn_btn(no){
	var  formData= $('#boardForm').serialize();
    $.ajax({
        cache : false,
        url : "${pageContext.request.contextPath}/boardDetail.do",
        type : 'POST', 
        data : formData, 
        success : function(data) {
        }, // success 

        error : function(xhr, status) {
            alert(xhr + " : " + status);
        }
    }); // $.ajax */

}

function fn_insert() {

	$('#boardForm').attr({
		action : '<c:url value="/orderView.do"/>',
		target : '_self'
	}).submit(); 
}

function fn_delete() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/deleteBoard.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('success');
			fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}


$(".modal_modify_btn").click(function(){
	var modifyConfirm = confirm("????????? ?????????????????????????");
	
	if(modifyConfirm) {
		var data = {
					repNum : $(this).attr("data-repNum"),
					repCon : $(".modal_repCon").val()
				};  // ReplyVO ????????? ????????? ??????
		
		$.ajax({
			url : '<c:url value="/shop/view/modifyReply.do"/>',
/* 			url : "/shop/view/modifyReply", */
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					replyList();
					$(".replyModal").fadeOut(200);
				} else {
					alert("????????? ????????? ??? ??? ????????????.");							
				}
			},
			error : function(){
				alert("???????????????????????????.")
			}
		});
	}
	
});

$(".modal_cancel").click(function(){
	//$(".replyModal").attr("style", "display:none;");
	$(".replyModal").fadeOut(200);
});

	$(".addCart_btn").click(function(){
		
		var gdsNum = $("#gdsNum").val();
		var cartStock = $(".numBox").val();
		
		var data = {
				gdsNum : gdsNum,
				cartStock : cartStock
				};
		
		$.ajax({
			url : '<c:url value="/view/addCart.do"/>',
/* 			url : "/view/addCart.do", */
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					alert("?????? ?????? ??????");
					$(".numBox").val("1");

				} else {
					alert("????????? ????????? ??? ????????????.")
					$(".numBox").val("1");
					window.location='<c:url value="/user/login.do"/>';

				}
			},
			error : function(){
				alert("?????? ?????? ??????");
			}
		});
	});
	
	// + ????????? ????????? ????????? ????????????, ????????? ?????? ???????????? ????????? ??????
	$(".plus").click(function(){
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;
		//var stock = ${view.gdsStock};
		var stock = $(".gdsStock_hidden");
		
		if(plusNum >= stock) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(plusNum);										
		}
	});


	// - ????????? ????????? ????????? ????????????, 1?????? ????????? ???????????? ??????
	$(".minus").click(function(){
		var num = $(".numBox").val();
		var minusNum = Number(num) - 1; 
		
		if(minusNum <= 0) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(minusNum);										
		}
	});
	
	


	
$("#orderBtn").click(function(){
		
		var gdsNum = $("#gdsNum").val();
		var gdsStock = $(".numBox").val();
		$('#gdsStock').val(gdsStock);
		var data = {
				gdsNum : gdsNum,
				gdsStock : gdsStock
				};
		
		$.ajax({
			url : '<c:url value="/orderItem.do"/>',
/* 			url : "/orderItem.do", */
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					$('#orderForm').attr({
						action : '<c:url value="/orderProcess.do"/>',
						target : '_self'
					}).submit(); 
					
					//$(".numBox").val("1");
				} else {
					alert("????????? ????????? ??? ????????????.")
					$(".numBox").val("1");
					window.location='<c:url value="/user/login.do"/>';

				}
			},
			error : function(){
				alert("??????");
			}
		});
	});
</script>
</html>

