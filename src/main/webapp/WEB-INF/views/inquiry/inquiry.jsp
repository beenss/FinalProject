<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="contact form example">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"
></script>
<title>Document</title>
<style>
@font-face {
	src: url("/fonts/GothicA1-Regular.ttf");
	font-family: "GothicA1-Regular.ttf";
}

@font-face {
	src: url("/fonts/AppleSDGothicNeoL.ttf");
	font-family: "AppleSDGothicNeoL.ttf";
}

@font-face {
	src: url("/fonts/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB.ttf";
}

.mailbox {
	margin: 0 auto;
}

.inquiry_banner {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 17px;
}

.main_text {
	font-size: 25px;
	font-family: "AppleSDGothicNeoB.ttf";
}

.send_inquiry {
	margin-top: -20px;
	margin-bottom: 50px;
	width: 110px;
	height: 40px;
}

.send {
	float: right;
}

.message_box {
	margin: 0 auto;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="inquiry_banner">
			<p class="main_text">CONTACT USð¨</p>
			<p class="message_box">
				ì¤í°ëí¬í¼ë¥¼ ì´ì©íë©´ì ê¶ê¸íë ì ì´ ììëì? ì´ë¤ ë¬¸ìë¼ë íììëë¤.<br> ê±´ìì¬í­ ë° ìë¹ì¤ ì´ì© ì ë¶í¸íë ì  ë±ë± ë¬´ìì´ë  í¬í¼ìê² íê³  ì¶ì
				ë©ì¸ì§ë¥¼ ë³´ë´ì£¼ì¸ì!
			</p>
		</div>
	</div>
	<div class="container">
		<form class="gform" method="POST"
			action="https://script.google.com/macros/s/AKfycby37mebJGD2Oc4KNsRZvb-jQiBmsVYxG-EL8HkDxQ/exec"
		>
			<div class="form-elements">
				<label for="title">ì ëª©</label> <input type="text" class="form-control" name="title" id="title"
					placeholder="ì ëª©ì ìë ¥í´ì£¼ì¸ì"
				> <label for="email">ë¬¸ì ì í</label>
				<select class="form-control" name="category" id="category" style="width: 100px">
					<option value="select" selected>ì ííì¸ì</option>
					<option value="member">ê°ì ê´ë ¨ ë¬¸ì</option>
					<option value="group">ê·¸ë£¹ ì¤í°ë ë¬¸ì</option>
					<option value="mystudy">ê³µë¶íê¸° ë¬¸ì</option>
					<option value="comunity">ì»¤ë®¤ëí° ë¬¸ì</option>
					<option value="etc">ê¸°í ë¬¸ì</option>
				</select>
				<label for="email">ì´ë©ì¼ ì£¼ì</label> <input type="text" class="form-control" name="email"
					id="email" placeholder="ê°ì ì ë±ë¡í ì´ë©ì¼ì ìë ¥í´ì£¼ì¸ì"
				> <label for="email">ë¬¸ì ë´ì©</label>
				<textarea class="form-control" name="contents" id="contents" placeholder="ë´ì©ì ìë ¥í´ì£¼ì¸ì"
					style="height: 170px;"
				></textarea>
				<br />
				<div style="text-align: center;">
					<button class="btn send">
						<img class="send_inquiry" src="/resources/images/sned_icon.png">
					</button>
				</div>
			</div>
			<div class="thankyou_message" style="display: none;">
				<h2>
					ê°ì¬í©ëë¤.<br> ê²í  í ë¹ ë¥¸ ëµë³ ëë¦¬ê² ìµëë¤.
				</h2>
			</div>
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			<script data-cfasync="false" type="text/javascript"
				src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"
			>
                </script>
		</form>
	</div>
</body>
</html>