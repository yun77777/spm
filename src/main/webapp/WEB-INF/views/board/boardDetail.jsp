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
<style>
body {
    background-color: #f7f6f6
}

.card {
    border: none;
    /* box-shadow: 5px 6px 6px 2px #e9ecef; */
    border-radius: 4px
}

.dots {
    height: 4px;
    width: 4px;
    margin-bottom: 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block
}

.badge {
    padding: 7px;
    padding-right: 9px;
    padding-left: 16px;
    /* box-shadow: 5px 6px 6px 2px #e9ecef */
}

.user-img {
    margin-top: 4px
}

.check-icon {
    font-size: 17px;
    color: #c3bfbf;
    top: 1px;
    position: relative;
    margin-left: 3px
}

.form-check-input {
    margin-top: 6px;
    margin-left: -24px !important;
    cursor: pointer
}

.form-check-input:focus {
    box-shadow: none
}

.icons i {
    margin-left: 8px
}

.reply {
    margin-left: 12px;
    margin-top: 20px; /* 21/06/03 added */
}

.reply small {
    color: #b7b4b4
}

.reply small:hover {
    color: green;
    cursor: pointer
}
</style>


<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="<c:url value='/se2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	
<!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    게시글 상세
                </h1>
                <!-- Content Row-->
                <!-- Contact Form-->
                <!-- In order to set the email address and subject line for the contact form go to the assets/mail/contact_me.php file.-->
                        <form id="boardForm" name="sentMessage" novalidate>
                        	<input type="hidden" id="currentPageNo" name="currentPageNo" value="1"/>
                        	<input type="hidden" id="B_TYPE" name="B_TYPE" value="${paramMap.B_TYPE}"/>
                        	<input type="hidden" id="replyType" name="replyType" value="${paramMap.replyType}"/>
                        	<input id="no" name="no" type="hidden" 
	                                    <c:if test='${empty paramMap.no}'>
	                                    value="${detail.B_NO}"</c:if>
	                                    <c:if test='${!empty paramMap.no}'>
	                                    value="${paramMap.no}"</c:if>>
                        	
                        	<input type="hidden" id="originNo" name="originNo"
	                                    <c:if test='${empty paramMap.originNo}'>
	                                    value="${detail.originNo}"</c:if>
	                                    <c:if test='${!empty paramMap.originNo}'>
	                                    value="${paramMap.originNo}"</c:if>
                        	/>
                        	<input type="hidden" id="groupOrd" name="groupOrd"
                        	<c:if test='${empty paramMap.groupOrd}'>
	                                    value="${detail.groupOrd}"</c:if>
	                                    <c:if test='${!empty paramMap.groupOrd}'>
	                                    value="${paramMap.groupOrd}"</c:if>
                        	/>
                        	<input type="hidden" id="groupLayer" name="groupLayer"
                        	<c:if test='${empty paramMap.groupLayer}'>
	                                    value="${detail.groupLayer}"</c:if>
	                                    <c:if test='${!empty paramMap.groupLayer}'>
	                                    value="${paramMap.groupLayer}"</c:if>
                        	/>
                            <button class="btn btn-secondary btn-sm float-right" onclick="fn_list()" type="button">목록</button>
                            <table class="table">
                            <colgroup>
                            	<col width="15%">
                            	<col width="*">
                            </colgroup>
							  <thead>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">글번호</th>
							      <td>
							      	<div class="controls">
	                                    <c:if test='${empty paramMap.no}'>
	                                    ${detail.B_NO}</c:if>
	                                    <c:if test='${!empty paramMap.no}'>
	                                    ${paramMap.no}</c:if>
                                	</div>
							      </td>
							     </tr>
							     <tr>
							     <th scope="row">아이디</th>
							      <td>
							      	<div class="controls">
                                    <c:if test='${empty paramMap.id}'>
	                                    ${detail.id}</c:if>
	                                    <c:if test='${!empty paramMap.id}'>
	                                    ${member.ID}</c:if>
                                	</div>
							      </td>
							      </tr>
							      <tr>
							      <th scope="row">제목</th>
							      <td>
							      	<div class="controls">
                                     <c:if test='${empty paramMap.title}'>
	                                    ${detail.title}</c:if>
	                                    <c:if test='${!empty paramMap.title}'>
                                      ${paramMap.title}</c:if>
                                	</div>
							      </td>
							      </tr>
							      <tr style="height:500px;">
							      <th scope="row">내용</th>
							       <td>
							      	<div class="controls">
							      	${detail.content}
                                	</div>
							      </td>
							    </tr>
							    <tr><td></td><td></td></tr>
							  </tbody>
							</table>
				</form>			
                <form id="writeForm" method="post" enctype="multipart/form-data">
					<input type="hidden" id="no" name="no" 
					<c:if test='${empty paramMap.no}'>
                    value="${detail.B_NO}"</c:if>
                    <c:if test='${!empty paramMap.no}'>
                    value="${paramMap.no}"z</c:if> />
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					<input type="hidden" id="type" name="type" value="save"> 
					
					<table id="fileIndex">
						<tbody>
						<colgroup>
                           	<col width="15%">
                           	<col width="*">
                        </colgroup>
							<tr>
								<td></td>
								<td>
									<c:forEach var="file" items="${fileList}" varStatus="var">
									<div>
										<img class="card-img-top" style="width:20%;height:auto" name="itemImg${var.index}" id="itemImg${var.index}" src="https://mybuckets3s3.s3.ap-northeast-2.amazonaws.com/${file.ORG_FILE_NAME}" alt="no image" />
<%-- 										<img class="card-img-top" style="width:20%;height:auto" name="itemImg${var.index}" id="itemImg${var.index}" src="<c:url value='/img/${file.ORG_FILE_NAME}'/>" alt="no image" /> --%>
										<input type="hidden" class="FILE_NO" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO}">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>${file.FILE_NO}
									</div>
									</c:forEach>
								</td>
							</tr>
						</tbody>			
					</table>
					
				</form>
                            
                            
                            <div id="success"></div>
                            
                            <div class="inputArea">
 
			</div>
                            
                            <!-- For success/fail messages-->
                        	<button class="btn btn-secondary btn-sm float-right" id="sbumit" onclick="fn_reply('${detail.B_NO}')" type="submit">답글</button>
                        	<button class="btn btn-info btn-sm float-right" id="updateBtn" type="button">수정</button>
			                <button class="btn btn-danger btn-sm float-right" id="sendMessageButton" onclick="fn_delete()" type="button">삭제</button>
			                
			                <table class="table table-sm">
								<tbody>
									<tr>
										<th scope="row">이전글</th>
										<c:if test="${!empty list[0].B_NO}">
											<td><a href="#" onclick="fn_detail('${list[0].B_NO}');">${list[0].TITLE}</a></td>
										</c:if>
										<c:if test="${empty list[0].B_NO}">
											<td>이전글이 없습니다.</td>
										</c:if>
									</tr>
									<tr>
										<th scope="row">다음글</th>
										<c:if test="${!empty list[1].B_NO}">
											<td><a href="#" onclick="fn_detail('${list[1].B_NO}');">${list[1].TITLE}</a></td>
										</c:if>
										<c:if test="${empty list[1].B_NO}">
											<td>다음글이 없습니다.</td>
										</c:if>
									</tr>
								</tbody>
							</table>
                        
                    </div>
            
            

<div class="container mt-5">
<h1>댓글</h1>
<h5 id="commentCnt">(${replyListLen})</h5>
    <div class="row d-flex justify-content-center">
    
        <div id="reply" class="col-md-8">
            <div class="headings d-flex justify-content-between align-items-center mb-3">
                
                <!-- <div class="buttons"> 
                <span class="badge bg-white d-flex flex-row align-items-center"> 
                <span class="text-primary">Comments "ON"</span>
                        <div class="form-check form-switch"> <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked> </div>
                </span> 
                </div> -->
            </div>
            
            <c:forEach var="result" items="${replyList}" varStatus="status">
             
			 <div class="card p-3 reply">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                     ${result.rno}
                     <span><small class="font-weight-bold text-primary">${result.writer}</small> <small class="font-weight-bold">${result.content}</small></span> </div> <small>2 days ago</small>
                </div>
                <div class="action d-flex justify-content-between mt-2 align-items-center">
                    <div class="reply px-4"> <small><a href="#" id="delete_btn">Remove</a></small>
                    	<input type="hidden" class="rno" value="${result.rno}">
                     <span class="dots"></span> <small>Reply</small> <span class="dots"></span> <small>Translate</small> </div>
                    <div class="icons align-items-center"> <i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i> </div>
                </div>
            </div>
		</c:forEach>
        </div>
    </div>
</div>

 
   
   
  
   <div class="container mt-5">
     
    <div class="row d-flex justify-content-center">
    
        <div id="reply" class="col-md-8">
          <form id="commentForm" method="post" enctype="multipart/form-data">
   <div class="card p-3 reply">
			 <table class="table table-borderless">
			 <%-- <colgroup>
				<col width="10%">
				<col width="*">
			</colgroup> --%>
			  <tbody>
			    <tr>
			      <th scope="row" colspan="2">${member.ID}</th>
			   </tr>
			   <tr>
			   	<td>
			   		<div class="d-flex justify-content-between align-items-center">
			             <div class="user d-flex flex-row align-items-center">
			              <textarea rows="5" cols="100" class="form-control" id="content" name="content"></textarea>
			              <span><small class="font-weight-bold text-primary">${result.writer}</small> <small class="font-weight-bold">${result.content}</small></span> </div> 
			         </div>
			   	</td>
			   </tr>
			   <tr>
			   	<td>
			   		<div class="action d-flex justify-content-between mt-2 align-items-center">
			             <div class="reply px-4"> <small>Remove</small> <span class="dots"></span> <small>Reply</small> <span class="dots"></span> <small>Translate</small> </div>
			             <div class="icons align-items-center"> <i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i> </div>
			         </div>
			         <button type="submit" class="btn btn-info btn-sm float-right" id="comment_btn">댓글 작성</button>
			         
			   	</td>
			   </tr>
			  </tbody>
			 </table>
     </div>
     <input type="hidden" id="bno" name="bno">
     <input type="hidden" id="writer" name="writer">
     <input type="hidden" id="rno" name="rno">
     <input type="hidden" id="B_TYPE" name="B_TYPE">
	</form>
</div>
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
var replyListLen=Number('${replyListLen}');
$("#commentCnt").html('('+replyListLen+')');
	
});

function fn_list() {
	$('#boardForm').attr({
		action : '<c:url value="/web/boardList.do"/>',
		target : '_self'
	}).submit();
}

function fn_detail(no,type){
	//var  formData= $('#boardForm').serialize();
	//$('#boardForm #replyType').val('N');

	$('#boardForm #no').attr('disabled',false);
	$('#boardForm #no').val(no);

	if(type==null){
		type='Detail';
	}
	
	$('#boardForm').attr({
		action : '<c:url value="/web/board'+type+'.do" />',
		target : '_self'
	}).submit();

}

function fn_delete() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/web/deleteBoard.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}

$(function() {
	$("#updateBtn").click(function() {
		var no=$("#boardForm #no").val();
		fn_detail(no,'Update');
	});
})

function fn_reply(no){
	//var  formData= $('#boardForm').serialize();
	
	//$('#boardForm #no').attr('disabled',false);
	var len=Number('${len}')+1;
	$('#boardForm #no').val(len);
/* 	$('#boardForm #no').val(${len}+1); */
/* 	$('#boardForm #no').val(Number(no)+1); */
	$('#boardForm #replyType').val('Y');
	//$('#boardForm #originNo').val(Number(no));
	//$('#boardForm #groupOrd').val(Number(no)+1);
	//$('#boardForm #groupLayer').val(Number(no)+1);

	$('#boardForm').attr({
		action : '<c:url value="/web/boardDetail.do" />',
		target : '_self'
	}).submit();

}


$("#delete_btn").click(function(){
	var confirm_val = confirm("정말 삭제하시겠습니까?");
	$("#bno").val($("#boardForm #no").val());
	$("#writer").val($("#boardForm #id").val());
	$("#rno").val($(this).parent().parent().find(".rno").val());
	
	var formData = new FormData($("#commentForm")[0]);

	if(confirm_val) {
													
		$.ajax({
			url : "${pageContext.request.contextPath}/web/reply/delete.do",
			type : "post",
			enctype: 'multipart/form-data',
			data : formData,
			processData : false,
			contentType : false,
			success : function(result) {
				fn_detail($("#bno").val());
				alert("삭제되었습니다.");
			}
		});
	}	
});

$("#comment_btn").click(function() {
	$("#bno").val($("#boardForm #no").val());
	$("#writer").val($("#boardForm #id").val());
	$("#commentForm #B_TYPE").val($("#boardForm #B_TYPE").val());
	var formData = new FormData($("#commentForm")[0]);
	/* $('#commentForm').attr({
		action : '<c:url value="reply/write.do" />',
		target : '_self'
	}).submit(); */
	
/* 	var bno=$("#bno").val();
	var writer=$("#writer").val();
	var content=$("#content").val(); */
	$.ajax({
		url : "${pageContext.request.contextPath}/web/reply/write.do",
		type : "post",
		//data : {bno:bno, writer:writer, content:content},
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			/* $("#replyList").append(result.list);
			var content='<tr><td>'+(result.len)+'</td>'
			content+='<td>'+result.paramMap.writer+'</td>'
			content+='<td>'+result.paramMap.content+'</td>'
			content+='</tr>';
			$("#replyTbl").append(content); */
			
			var content='';
			content+='<div class="card p-3 reply">';
			content+='<div class="d-flex justify-content-between align-items-center">';
			content+='<div class="user d-flex flex-row align-items-center">'+(result.len);
			content+='<span><small class="font-weight-bold text-primary">'+(result.paramMap.writer)+'</small>';
           	content+='<small class="font-weight-bold">';
           	content+=(result.paramMap.content)+'</small></span> </div> <small>2 days ago</small></div>';
            content+='<div class="action d-flex justify-content-between mt-2 align-items-center">';
           	content+='<div class="reply px-4"> <small>Remove</small> <span class="dots"></span> <small>Reply</small> <span class="dots"></span> <small>Translate</small> </div>';
           	content+='<div class="icons align-items-center"> <i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i> </div></div></div>';
                
			$("#reply").append(content);
			$("#commentCnt").html('('+result.len+')');
			
			
			
		
			$("#commentForm #content").val('');
			//fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
});

</script>

</html>

