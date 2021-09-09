<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<script type = "text/javascript" src=check.js></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="generator" content="Namo WebEditor(Trial)">
<title>CADDOK</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: ;
	background-repeat: no-repeat;
}

<!--
body {
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: ##D5D5D5;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #D5D5D5;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #ffffff
}

body, td, select, input, div, form, textarea, center, option, pre,
	blockquote {
	font-size: 9pt;
	font-family: 나눔고딕;
	color: #747474;
}

-->
::-webkit-scrollbar {
	width: 6px;
	height: 6px;
	border: 3px solid #ffffff;
}

::-webkit-scrollbar-button:start:decrement {
	display: block;
	height: 10px;
	background: #ff5e85;
}

::-webkit-scrollbar-button:end:increment {
	display: block;
	height: 10px;
	background: #696969;
}

::-webkit-scrollbar-track {
	background: #696969;
}

::-webkit-scrollbar-thumb {
	height: 50px;
	width: 50px;
	background: #ff5e85;
}

a:link {
	color: #747474;
	text-decoration: none
}

a:visited {
	color: #747474;
	text-decoration: none
}

a:active {
	color: #747474;
	text-decoration: none
}

a:hover {
	color: #FF6A89;
	text-decoration: none
}
</style>
<script type="text/javascript"
	src="http://design-recipe.net/design/script.js"></script>
</head>

<body marginwidth="0" marginheight="0" onload="document.loginform.id.focus()">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td align="center"><table width="1200" border="0"
						cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td valign="top" style="padding-top: 18px;"><img
									src="https://t1.daumcdn.net/cfile/tistory/994FFC435C98BD0A32?original" alt="" width="1200"
									height="138" usemap="#Map2" border="0">
							</tr>
							<tr>
								<td height="52" valign="top"
									background="https://t1.daumcdn.net/cfile/tistory/99FBC7415C84C1F514?original">
									<table width="1200" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td width="350" height="52" align="right"><a
													href="Main.jsp" onmouseout="MM_swapImgRestore()"">
														<span style="padding-right: 10px;"><img
															src="images/tomainlogo2.png" alt="" width="150"
															height="52" id="Image3" border="0"></span>
												</a></td>
												<td width="210"><a href="Frequentpattern.jsp"
													onmouseout="MM_swapImgRestore()">
														<span style="padding-right: 50px;"><img
															src="images/tonnlogo.png" alt="" width="210"
															height="52" id="Image4" border="0"></span>
												</a></td>
												<td width="200"><a href="stock_prediction.jsp"
													onmouseout="MM_swapImgRestore()">
														<span style="padding-right: 40px;"><img
															src="images/tomclogo.png" alt="" width="200"
															height="52" id="Image6" border="0"></span>
												</a></td>
												<td width="350" align="left"><a href="Clustering.jsp"
													onmouseout="MM_swapImgRestore()">
														<span style="padding-left: 10px;"><img
															src="images/toftlogo.png" alt="" width="172"
															height="52" id="Image9" border="0"></span></a>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td height="300"><script type="text/javascript">
									//<![CDATA[
									var img_url = new Array();
									var img_link = new Array();
									var uniq_code = "neorix_enple";
									var moving_pixel = 0.9;
									var moving_speed = 40;
									var moving_auto = "Y";
									var moving_autotime = 2;

									// 이동 버튼 아이콘
									var button_icon_url1 = "http://labs1.cafe24.com/web/new/left.png"; // 이미지 URL (좌측)
									var button_icon_url2 = "http://labs1.cafe24.com/web/new/right.png"; // 이미지 URL (우측)
									var button_icon_width = 0; // 이미지 넓이 (픽셀)
									var button_icon_height = 0; // 이미지 높이 (픽셀)

									// 영역 및 이미지 설정
									var img_width = 1200; // 이미지 가로 (픽셀)
									var img_height = 300; // 이미지 높이 (픽셀)

									// 이미지 파일 경로 및 링크
									// 현재페이지로 링크 : location='http://www.naver.com';

									// 새창으로 링크 : window.open('http://www.naver.com');

									// 이미지 파일 경로 및 링크
									// 현재페이지로 링크 : location='http://www.naver.com';

									// 새창으로 링크 : window.open('http://daum.net');

									img_url[0] = "https://t1.daumcdn.net/cfile/tistory/991ACC4B5C9525A804";
									img_link[0] = "location='#';";

									img_url[1] = "http://cfile22.uf.tistory.com/original/233D014B593C96C3131039";
									img_link[1] = "location='#';";

									img_url[2] = "https://t1.daumcdn.net/cfile/tistory/991AEB4B5C9525A904";
									img_link[2] = "location='#';";

									img_url[3] = "https://t1.daumcdn.net/cfile/tistory/9918324B5C9525A905";
									img_link[3] = "location='#';";
									
									var total_array1 = total_array2 = "";
									for (i = 0; i < img_link.length; i++) {
										total_array1 = total_array1
												+ img_url[i] + "|";
										total_array2 = total_array2
												+ img_link[i] + "|";
									}

									neorix_img_scroll_type3_make_html(
											uniq_code, total_array1,
											total_array2, img_width,
											img_height, moving_pixel,
											moving_speed, moving_autotime,
											button_icon_url1, button_icon_url2,
											button_icon_width,
											button_icon_height, moving_auto);
								</script>

									<div id="layer_d_left"
										style="position: absolute; right: 30px; padding: 0px; margin: 0px; z-index: 3;">
										<div id="layer_d_left_in"
											style="position: absolute; width: 0px; height: 0px; top: -0px; right: 0px; padding: 0px; margin: 0px; z-index: 3; cursor: pointer; overflow: hidden;"
											onclick="document.getElementById('neorix_enple_direction').value='left'; neorix_img_scroll_type3_move('neorix_enple',6,1200,0.9,39);">
											<img src="http://labs1.cafe24.com/web/new/right.png"
												alt="NEXT">
										</div>
									</div> 
									<input type="hidden" id="neorix_enple_now_no" value="2">
									<input type="hidden" id="neorix_enple_direction" value="left">
									<input type="hidden" id="neorix_enple_moving_check" value="Y">
									<input type="hidden" id="neorix_enple_time_count" value="1">
									<input type="hidden" id="neorix_enple_mouse_over" value="N">&nbsp;
									</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td align="center" style="border-bottom: 2px #ededed solid;"><table
						width="1200" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="380" align="right">
									<table height="22" border="0" cellpadding="0" cellspacing="0">
									</table>
									<input type="hidden" name="group_no" value="1"></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			
			<tr>
				<td align="center" style="border-bottom: 2px #ededed solid;"><table
						width="1200" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="600" height="37" align="left"><img
									src="images/loginjoin.png" alt="" width="65"
									height="8"></td>
								<td width="380" align="right">
								<script>
									function zb_login_check_submit() {
										if (!document.zb_login.user_id.value) {
											alert("ID를 입력하여 주십시오.");
											document.zb_login.user_id.focus();
											return false;
										}
										if (!document.zb_login.user_pwd.value) {
											alert("Password를 입력하여 주십시오.");
											document.zb_login.user_pwd.focus();
											return false;
										}
										return true;
									}
								</script> 
								<%if ((session.getAttribute("session_user_name") == null)) {%>
									<table height="22" border="0" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
												<form name="zb_login" method="post" action="userLoginAction.jsp" onsubmit="return zb_login_check_submit();">
												<input type="hidden" name="s_url" value="%2Fver1%2Fintro.html">
													<td valign="middle"><input type="text" name="user_id"
														onblur="document.zb_login.user_pwd.focus();" value=""
														maxlength="20" placeholder="아이디"
														style="color: #aaaaaa; background-color: #ffffff; border: 1 #ececec solid; width: 95px; height: 17px; padding-left: 20px;"></td>
													<td width="5"></td>
													<td valign="middle"><input type="password"
														name="user_pwd" value="" maxlength="20" placeholder="비밀번호"
														style="color: #aaaaaa; background-color: #ffffff; margin-right: 10px; border: 1 #ececec solid; width: 95px; height: 17px; padding-left: 30px;"></td>
													<td><input type="image"
														src="images/i_login.gif" border="0">
													<a href="#"
														onclick="window.open('join.jsp','zbMemberJoin','width=560,height=590,toolbars=no,resizable=yes,scrollbars=yes')">
															<img src="images/i_join.gif" border="0">
													</a></td>
												</tr>
												<input type="hidden" name="group_no" value="1">
											</tbody>
										</form>
									</table> <%
 	} else if(session.getAttribute("session_admin_name") != null){} else{
 %> 
 <%=session.getAttribute("session_user_name")%>님 환영합니다. <a
									href="userLogoutAction.jsp">&nbsp;<img src="images/logout.png" border="0"></a> <%
 	}
 %> <input type="hidden" name="group_no" value="1"></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td align="center"
					style="padding-top: 30px; background-image: url(/ver1/bg.jpg); background-repeat: repeat-x; background-position: bottom;">
					<table width="1200" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="839" align="left" valign="top">
									<table width="839" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td height="16" align="left" valign="top"
													style="border-bottom: 1px #ededed solid;"><img
													src="images/notice.png" width="65" height="8"
													alt="" /> </td>
												<td height = "16" align="right" valign="top"
												style="border-bottom: 1px #ededed solid;"><a href="#none" title="글쓰기"
														onclick="window.open('notice.jsp','notice','width=560,height=590,toolbars=no,resizable=yes,scrollbars=yes')">글쓰기</a>
												</td>			
											<tr>
												<td height="100" valign="top"
													style="padding-top: 10px; line-height: 20px;">
													<br><br><b><div style="line-height: 40px"><font size="6px" color="#FF6A89">WELCOME
															TO KSE!</font></b><br><font size="4px">안녕하세요. 쉽고 편리한 고객분석 서비스를 제공할
													카똑(CADDOK) 입니다.</font></div>
													<br><br>카똑은 개발자 김지현, 성원영, 이주연의 성을 따서 만든 김성이 팀이 만든 홈페이지로 카페를 운영하는 분들이 보다 쉽고 다양한 고객 분석 기능을
													<br>활용하게 하자는 취지로 2019년 프로젝트를 시작하였습니다.
													<br>현재 전국 300여 카페에서 서비스를 이용중이며 김성이도 열렬한 성원에 보답하기 위하여 노력하고 있습니다.
													<br>김성이와 함께 즐거운 카페 관리 시작하세요!:)<br><br><b><font size="2px" color="#484848">
													1. 고객 성향 분석: 메뉴명을 입력하여 해당 메뉴를 먹는 고객은 또 다른 어떤 메뉴를 즐겨먹는지 확인할 수 있는 기능입니다. <br>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정 확률 이상의 결과만 제공합니다.<br>
													2. 재고 예측: 최근 3개월 간의 고객 주문 내역을 바탕으로 다음 달에 필요한 재고의 양을 예측할 수 있는 기능입니다.<br>
													3. 고객 유형 분류: 고객의 과거 구매이력을 분석하여 어떤 구매 유형의 고객들이 존재하는지 보여줍니다.<br>
													</font></span>
													
													<div style="margin-top: 40px;">
														<b><font color="FF0072">*</font> 카똑은 Google
															chrome, 해상도 1280*1024 이상에 최적화되어 있습니다.</b><br>
														&nbsp;&nbsp;<font color="FF0072">인터넷 익스플로러로 로그인이
															안될때는 [도구]-[인터넷 옵션]-[개인정보] 에서 설정을 '낮음'으로 해주세요.
														</font>
													</div></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="30" align="left" valign="top" bgcolor="#FFFFFF"></td>
								<td width="331" align="left" valign="top" bgcolor="#FFFFFF">
									<table width="331" border="0" cellspacing="0" cellpadding="0">
									
										<tbody>
											<tr>
												<td height="16" align="left" valign="top"
													style="border-bottom: 1px #ededed solid;"><img
													src="images/contact.png" width="65" height="8"
													alt=""></td>
											</tr>											
											<tr>
												<td height="200" valign="top" style="padding-top: 20px;">
													<!-- MM_swapImage --> <a class="twitter-timeline"
													data-width="331" data-height="200" data-theme="light"
													href="https://twitter.com/CADDOKofficial">Tweets by CADDOKofficial</a>
													<script async src="//platform.twitter.com/widgets.js"
														charset="utf-8"></script>
												</td>
											</tr>
											<tr>
												<td height="13" align="left" valign="top"
													style="border-bottom: 1px #ededed solid;">
											</tr>
											<tr>
												<td height="228" align="left" valign="top"
													style="padding-top: 10px;"><br> Tel)
													010 - 1989 - 1214<br>&emsp;&nbsp;&nbsp;&nbsp;010
													- 1999 - 0809<br> <br> Email) CADDOKofficial@gmail.com<br>
													<br> SNS)<br> <br>
													<div style="position: relative">
														<div>
															<a href="https://twitter.com/@CADDOKofficial" target="_blank"><img
																src="images/twitter.png" width="30" height="30"
																alt="">
																<div style="position: absolute; top: 4px; left: 33px;">&nbsp;twitter.com/@CADDOKofficial</div></a>
														</div>
														<div>
															<a href="https://instagram.com/CADDOKofficial" target="_blank"><img
																src="images/instagram.png" width="30"
																height="30" alt="">
														</div>
														<div style="position: absolute; top: 38px; left: 33px;">&nbsp;instagram.com/CADDOKofficial</div>
														</a>
														<div>
															<a href="https://facebook.com/BesTrip-1233832336725243" target="_blank"><img
																src="images/facebook_2.png" width="30" height="30"
																alt="">
														</div>
														<div style="position: absolute; top: 70px; left: 33px;">&nbsp;facebook.com/CADDOKofficial</div>
														</a></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>

							<div style="position: absolute; top: 1089px; right: 165px;">
								<a href="#none" title="글쓰기"
									onclick="window.open('/img_board.jsp','notice','width=560,height=590,toolbars=no,resizable=yes,scrollbars=yes')">글쓰기</a>
							</div>

							<tr>
								<td height="16" colspan="3" align="left" valign="top"
									style="border-bottom: 1px #ededed solid;"><img
									src="images/latest.png" width="100" height="7" alt=""></td>

							</tr>
							<tr>
								<td height="190" colspan="3" bgcolor="#FFFFFF"
									style="padding: 20px 15px;"><table border="0" width="100%"
										cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
											</tr>
											<tr>
												<td width="100%">
												</td>
											</tr>
											<tr height="80"></tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#696969"><table width="1100"
						border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td height="237" valign="top"><img
									src="images/copyright_re.png" alt="" width="1100"
									height="144" usemap="#Map" border="0"></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>
	<map name="Map">
		<area shape="rect" coords="588,21,612,41" href="https://facebook.com/CADDOKofficial" target="_blank"
			onfocus="this.blur();">
		<area shape="rect" coords="551,21,575,41" href="https://instagram.com/CADDOKofficial" target="_blank"
			onfocus="this.blur();">
		<area shape="rect" coords="517,21,541,41" href="https://twitter.com/@CADDOKofficial" target="_blank"
			onfocus="this.blur();">
		<area shape="rect" coords="489,99,610,117" href="#"
			onfocus="this.blur();">
		<area shape="rect" coords="485,21,509,41"
			href="mailto:CADDOKofficial@gmail.com" target="_blank" onfocus="this.blur();">
	</map>
</body>
</html>