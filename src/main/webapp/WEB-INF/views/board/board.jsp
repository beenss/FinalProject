<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- bootstrapwatch -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cosmo/bootstrap.min.css"
	integrity="sha384-5QFXyVb+lrCzdN228VS3HmzpiE7ZVwLQtkt+0d9W43LQMzz4HBnnqvVxKg6O+04d"
	crossorigin="anonymous">

<title>게시판</title>
</head>
<style>
.container {
	margin-top: 100px;
}

.btn-default {
	border: 1px solid #ced4da;
}

input:first-child {
	display: inline;
}

.td {
	display: none;
}

a {
	text-decoration: none;
	color: black;
}

.head-text {
	border-bottom: 1px solid #ced4da;
}

.row>* {
	padding: 0%;
}

h2 {
	font-weight: bolder;
	margin-bottom: 20px;
}

.writeBtn {
	text-align: center;
	margin-top: 0%;
}

.pagination {
	justify-content: center;
}

.textNo {
	text-align: center;
	border-bottom: 0ch;
}

thead, tbody {
	text-align: center;
}

.searchInput {
	margin-top: 40px;
	justify-content: end;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 head-text">
				<h2>지식 커뮤니티</h2>
			</div>
		</div>
		<form id="searchForm">
			<div class="row searchInput">
				<div class="col-1 mb-3 searchInput1">
					<div class="form-group">
						<select class="form-select" id="exampleSelect1" name="category">
							<option selected value="all">전체</option>
							<option value="mem_nick">닉네임</option>
							<option value="bo_title">제목</option>
							<option value="bo_content">내용</option>
						</select>
					</div>
				</div>
				<div class="col-3 mb-3 searchInput1">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="검색어를 입력하세요"
							id="keyword" aria-describedby="button-addon2" name="keyword">
						<button class="btn btn-dark" type="button" id="searchBtn">검색</button>
					</div>
				</div>
			</div>

		</form>
		<div class="row">
			<div class="col-12">
				<table class="table">
					<colgroup>
						<col style="width: 10%">
						<col style="width: 40%">
						<col style="width: 25%">
						<col style="width: 15%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.size() == 0}">
							<tr>
								<th colspan="5" class="textNo">등록된 게시물이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${list.size() > 0}">
							<c:forEach items="${list}" var="dto">
								<tr class="tr">
									<th scope="row">${dto.bo_seq}</th>
									<td><a href="/board/toDetail?bo_seq=${dto.bo_seq}">${dto.bo_title}</a></td>
									<td>${dto.mem_nick }</td>
									<td>${dto.bo_date}</td>
									<td>${dto.view_count}</td>
									<td class="td">${dto.bo_content}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row navi">
			<div class="col-12 colNavi">
				<ul class="pagination justify-content-center">
					<c:if test="${naviMap.needPrev eq true }">
						<li class="page-item"><a class="page-link"
							href="/board/toBoard?curPage=${naviMap.startNavi-1}"><</a></li>
					</c:if>

					<c:forEach var="pageNum" begin="${naviMap.startNavi}"
						end="${naviMap.endNavi}" step="1">
						<li class="page-item"><a class="page-link"
							href="/board/toBoard?curPage=${pageNum}">${pageNum}</a></li>
					</c:forEach>

					<c:if test="${naviMap.needNext eq true }">
						<li class="page-item"><a class="page-link"
							href="/board/toBoard?curPage=${naviMap.endNavi+1}">></a></li>
					</c:if>
				</ul>

			</div>
		</div>
		<div class="row writeBtn">
			<div class="col-12">
				<button type="button" class="btn btn-warning" id="writeBtn">질문하기</button>
			</div>
		</div>
	</div>
	<script>
		$("#writeBtn").on("click", function() { // 글쓰기로 페이지 이동
			location.href = "/board/toWrite";
		})
		$("#searchBtn").on("click", function() { // 검색
			if($("#keyword").val()==""){
				alert("검색어를 입력하세요");
				}else{
			let data = $("#searchForm").serialize();
			console.log(data);
			$.ajax({
				url : "/board/search?curPage=1",
				type : "get",
				data : data,
				success : function(data) {
					console.log(data)
					 $("tbody").empty();
					if(data.length == 0){
						let tr = $("<tr>");
						let td = $("<td colspan=5>").append("등록된 게시물이 없습니다.").addClass("textNo");
						tr.append(td);
						tr.appendTo("tbody");
					} else{
						for(dto of data){
						let tr = $("<tr>").addClass("tr");
						let th = $("<th>").append(dto.bo_seq).attr("scope","row");
						let a = $("<a>").append(dto.bo_title).attr("href","/board/toDetail?bo_seq="+dto.bo_seq);
						let td1 = $("<td>").append(a);
						let td3 = $("<td>").append(dto.bo_date);
						let td2 = $("<td>").append(dto.mem_nick);
						let td4 = $("<td>").append(dto.view_count);
						let td5 = $("<td>").append(dto.bo_content).addClass("td");
						tr.append(th,td1,td2,td3,td4,td5);
						tr.appendTo("tbody");			
						}
						/* navi */
						let ul = $("<ul>").addClass("pagination justify-content-center")
						let liPre = $("<li>").addClass("page-item");
						let a1 = $("<a>").addClass("page-link").attr("href","/board/toBoard?curPage=${naviMap.startNavi-1}").html("<");
						
						let liNum = $("<li>").addClass("page-item");
						let a2 = $("<a>").addClass("page-link").attr("href","/board/toBoard?curPage=${pageNum}").val("${pageNum}");
						
						let liOne = $("<li>").addClass("page-item");
						let one = $("<a>").addClass("page-link").attr("href","/board/toBoard?curPage=1").val("1");
						
						let liNext = $("<li>").addClass("page-item");
						let a3 = $("<a>").addClass("page-link").attr("href","/board/toBoard?curPage=${naviMap.startNavi+1}").html(">");
						
						// 네비바 비동기로 만들어 주기
						/* $(".colNavi").empty();
						if(data.length <= 10){// 게시글이 10개 이하 일때
							liOne.append(one);
							ul.append(liOne);
							$(".colNavi").append(ul);
						} *//* else{ // 게시글이 10개 이상일때
							
						} */
						
						
						
						/* <ul class="pagination justify-content-center">
						<c:if test="${naviMap.needPrev eq true }">
							<li class="page-item"><a class="page-link"
								href="/board/toBoard?curPage=${naviMap.startNavi-1}"><</a></li>
						</c:if>

						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi}" step="1">
							<li class="page-item"><a class="page-link"
								href="/board/toBoard?curPage=${pageNum}">${pageNum}</a></li>
						</c:forEach>

						<c:if test="${naviMap.needNext eq true }">
							<li class="page-item"><a class="page-link"
								href="/board/toBoard?curPage=${naviMap.endNavi+1}">></a></li>
						</c:if>
					</ul> */
						
					}  
				},
				error : function(e) {
					console.log(e);
				}
			})
				}
		})
	</script>
</body>
</html>












