<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>login</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}

.login {
	width: 200px;
	font-size: 35px;
	font-family: "MinSans-bold.otf";
	color: rgb(68, 129, 71);
	margin-top: 70px;
	text-align: center;
	margin: 0 auto;
}

.logininput {
	margin: 0 auto;
	width: 330px;
	padding: 20px;
	padding-bottom: 10px;
}

#loginBtn {
	width: 120px;
	margin: 0 auto;
	margin-left: 85px;
	background-color: #1e8ae9;
	border: 1px solid white;
	height: 40px;
	border-radius: 40px;
	font-size: 15px;
	color: white;
	font-weight: bold;
}

#memberBtn {
	width: 120px;
	margin: 0 auto;
	margin-right: 85px;
	background-color: rgba(84, 89, 224, 0.741);
	border: 1px solid rgb(255, 255, 255);
	height: 40px;
	border-radius: 40px;
	font-size: 15px;
	color: white;
	font-weight: bold;
}

.emailSave {
	padding-bottom: 30px;
	text-align: center;
	margin-right: 140px;
}

.search {
	margin: 0 auto;
	font-size: 15px;
	text-align: center;
	font-weight: bold;
}

#idSearch {
	text-decoration-line: none;
}

#passwordSearch {
	text-decoration-line: none;
}

#id {
	border-radius: 10px;
}

#password {
	border-radius: 10px;
}

.nothing {
	margin-top: 10px;
}

span {
	color: #0d6efd;
}
</style>
</head>
<body>
	<form id="loginForm">
		<div class="row m-3">
			<div class="col d-flex justify-content-center">
				<h2>?????????</h2>
			</div>
		</div>

		<div class="row justify-content-around logininput">
			<input type="text" id="id" name="mem_id" value="${mem_id}" required
				placeholder="???????????? ??????????????????.">
			<div class="nothing"></div>
			<input type="password" id="password" name="mem_pw" required
				placeholder="??????????????? ??????????????????.">
		</div>

		<div class="row justify-content-center text-center">
			<div class="col-6 text-end">
				<button type="button" id="loginBtn">?????????</button>
			</div>
			<div class="col-6 text-start">
				<button type="button" id="memberBtn">????????????</button>
			</div>
		</div>
		
		<div class="row justify-content-center emailSave">
				<div class="col-lg-2">
					<input type="checkbox" id="emailSave" name="emailSave">?????????	????????????
				</div>
		</div>

		<p id="token-result"></p>

		<div class="btnBox d-flex justify-content-center">
			<a href="javascript:kakaoLogin()"> <img	src="/resources/images/kakao_login_medium_narrow.png" alt="????????? ????????? ??????" />
			</a>
		</div>

		<br>
		<div class="row justify-content-center search">
			<div class="col-lg-3">
				<a class="link" href="#" id="idSearch">????????? ??????</a> <span>/</span> <a
					class="link" href="#" id="passwordSearch">???????????? ??????</a>
			</div>
		</div>

	</form>
	
	<!-- ????????? ???????????? ????????? ???????????? checkbox ?????? -->
		<script type="text/javascript">

	    	$('#main-logo').on('click', () => {
	    		location.href = "/home";
	    	})
	    	$('#main-logo').on('click', () => {
	    		location.href = "/home";
	    	})
            $(function () {
                fnInit();
            });

            function fnInit() {
                var cookieid = getCookie("emailSave");
                console.log(cookieid);
                if (cookieid != "") {
                    $("input:checkbox[id='emailSave']").prop("checked", true);
                    $('#id').val(cookieid);
                }

            }

            function setCookie(name, value, expiredays) {
                if (expiredays == 0) {
                    document.cookie = name + "=" + escape(value) + "; path=/; max-age=0;";
                } else {
                    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
                }
                console.log(document.cookie);
            }
            
            function saveid() {
                var expdate = new Date();
                if ($("#emailSave").is(":checked")) {
                    expdate.setTime(expdate.getTime() + 1);
                    setCookie("emailSave", $("#id").val(), expdate);
                } else {
                    expdate.setTime(expdate.getTime() - 1);
                    setCookie("emailSave", $("#id").val(), 0);
                }
            } 

            function getCookie(Name) {
                var search = Name + "=";
                console.log("search : " + search);

                if (document.cookie.length > 0) { // ????????? ???????????? ????????? 
                    offset = document.cookie.indexOf(search);
                    console.log("offset : " + offset);
                    if (offset != -1) { // ????????? ???????????? 
                        offset += search.length;
                        // set index of beginning of value
                        end = document.cookie.indexOf(";", offset);
                        console.log("end : " + end);
                        // ?????? ?????? ????????? ?????? ????????? ?????? ?????? 
                        if (end == -1)
                            end = document.cookie.length;
                        console.log("end??????  : " + end);

                        return unescape(document.cookie.substring(offset, end));
                    }
                }
                return "";
            }

           
        </script>

	<script>
	
	// ?????????
	window.Kakao.init('1d93d50b4296c95206af1d69936465bf'); // SDK??? ????????? ????????? ???????????? ??? ??? javascript?????? ???????????????.
	console.log(Kakao.isInitialized()); // sdk?????????????????????
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'account_email'
			, success: function(authObj){
				console.log(authObj);
				window.Kakao.API.request({
					url : '/v2/user/me'
					, success : res => {
						const kakao_account = res.kakao_account;
						const mem_id = kakao_account.email;
						
						console.log(kakao_account);
						console.log(mem_id);
						location.href = '/member/kakaoSignUp?mem_id=' + mem_id;
										/*
										$.ajax({
                        				type: "post",
                       					 url: '/member/kakaoLogin', // ?????????
                      					  data: { "mem_id" : mem_id },
                      					  dataType: "text",
                        				success: function (data) {
                            					console.log(data);
                            					if (data === "fail") {// ????????????
                               					console.log("??????!");
                               					//location.href = "/member/kakaoSignUp"
                              					 location.href = '/member/kakaoSignUp?mem_id=' + mem_id;
                          					  } else if (data === "success") {
								console.log("success");
								location.href="/"
                           					 }
                        }, error: function (request, status, error) {
                            console.log("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
                        }
                    })*/
                    // ajax???
                }
				, fail: function (error) {
					alert(error);
				}
            })
        }
    })
};


	// ?????????, ???????????? ????????? ????????? ??????~
	$('#id, #password').on('keypress', function(e){ 
	    if(e.keyCode == '13'){ 
	        $('#loginBtn').click(); 
	    }
	});
	
	
	// ???????????? ?????? ????????? ???????????? ???????????? ??????
	
	document.getElementById("memberBtn").onclick = function(){
		location.href = "/member/signup"
	}	
	
	 
	document.getElementById("loginBtn").onclick = function(){
		let login = $("#loginForm").serialize();
		console.log(login);
		if( $('#id').val() == "" || $('#password').val() == "" ){
			alert("????????? ?????? ??????????????? ??????????????????.");
		}else if($('#id').val() == "admin" || $('#password').val() == "admin"){
			alert("????????? ???????????? ???????????????.");
			location.href = "/admin/toAdmin";
		}else{
			// ?????????, ???????????? ?????? ??? ajax??????
			$.ajax({
				url : "/member/loginForm"
				,type : "post"
				,data :login
				, success: function(data){
					console.log(data);
					if(data === "success"){
						alert("????????? ???????????????.");
						saveid();
						location.href = "/member/toLogin";
					}else if(data === "fail"){
						alert("????????? ?????? ??????????????? ???????????? ????????????.");
						$('#password').val("");
						return;
					}else if(data === "blackMem"){
						alert("?????????????????????. ??????????????? ??????????????????. \n???????????? : 031-533-8282");
						return;
					}
				}, error : function(e){
					console.log(e);
				}
			})
			
		}
	}
	// ????????? ?????? ?????? ????????? ????????? ?????????
    document.getElementById("idSearch").onclick = function () {
        let url = "/member/searchId"; 
        let name = "????????? ??????"; // ????????? ?????????
        let option = "width=600, height=400, left=500, top=300"; // ????????? ??????, ??????
        window.open(url, name, option);
    }
	
	// ???????????? ?????? ?????? ????????? ????????? ?????????
    document.getElementById("passwordSearch").onclick = function () {
        let url = "/member/searchPw"; 
        let name = "???????????? ??????"; // ????????? ?????????
        let option = "width=650, height=420, left=500, top=300"; // ????????? ??????, ??????
        window.open(url, name, option);
    }

	</script>
</body>
</html>