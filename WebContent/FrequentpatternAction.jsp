<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.lang.*" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>

<body marginwidth="0" marginheight="0">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td align="center"><table width="1200" border="0"
						cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td valign="top" style="padding-top: 18px;"><img
									src="https://t1.daumcdn.net/cfile/tistory/994FFC435C98BD0A32?original"alt="" width="1200"
									height="138" usemap="#Map2" border="0">
							</tr>
							<tr>
								<td height="52" valign="top"
									background="https://t1.daumcdn.net/cfile/tistory/99FBC7415C84C1F514?original">
									<table width="1200" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<tr>
													<td width="350" height="52" align="right"><a
													href="Main.jsp" onmouseout="MM_swapImgRestore()"">
														<span style="padding-right: 10px;"><img
															src="images/tomainlogo2.png" alt="" width="150"
															height="52" id="Image3" border="0"></span></a>
													</td>
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
									</td>
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
									<td height="16" align="left" valign="top"
										style="border-bottom: 1px #ededed solid;"><img
										src="images/frequent.png" width="100" height="12" alt="">
									</td>
								</tr>
								<tr>
									<td height="100" valign="top"
										style="padding-top: 10px; line-height: 20px;"><br>
										<div id="Chart" style="height: 300px;"></div>
										<script>
										new Morris.Bar({
											  element: 'Chart',
											  data: [
												{ menu: '아이스아메리카노', a: 100 },
											    { menu: '아이스카페라떼', a: 31.6 },
											    { menu: '아이스카페라떼\n핫아메리카노', a: 10.5 },
											    { menu: '핫헤이즐넛라떼', a: 9.5 },
											    { menu: '아이스카페라떼\n아이스바닐라라떼', a: 8.4 },
											    { menu: '자몽에이드', a: 7.4 },
											    { menu: '아이카페모카', a: 7.4 },
											    { menu: '아이스헤이즐넛라떼\n아이스바닐라라떼', a: 7.4 }
											  ],
											  xkey: 'menu',
											  ykeys: ['a'],
											  labels: ['구매 고객'],
											  gridTextFamily: '나눔스퀘어',
											  barColors: function (row, series, type) {
													console.log("--> "+row.label, series, type);
													if(row.label == "아이스아메리카노") return "#0B62A4";
													else return "#7A92A3";
											}
											});
									</script><br><br><center>
										<span style="font-family:나눔스퀘어; line-height:150%">
										<font size="5px">●아이스 아메리카노를 구매하는 고객 100명 중</font><br><br>
										<span style="line-height:250%">
										<font size="4px">
										<%
										BufferedReader reader = null;
										try {
											String filePath = application.getRealPath("iceAmericanoResult.txt");
											reader = new BufferedReader(new FileReader(filePath));
											while (true) {
												String str = reader.readLine();
												if (str == null)
													break;
												out.print(str + "</br>");
											}
										} catch (FileNotFoundException fnfe) {
											out.print("파일이 존재 하지 않습니다.");
										} catch (IOException ioe) {
											out.print("파일을 읽을 수 없습니다.");
										}

										finally {
											try {
												reader.close();
											} catch (Exception e) {

											}
										}%></font><br></span>
										<font size="5px">도 함께 구매합니다!</font>
										</span></center>
									</td>
								</tr>
							<tr>
								<td height="16" colspan="3" align="left" valign="top">
								</td>
							</tr>
							<tr>
								<td height="190" colspan="3" bgcolor="#FFFFFF"
									style="padding: 20px 15px;">
									<table border="0" width="100%" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td width="100%"></td>
											</tr>
											<tr height="80"></tr>
										</tbody>
									</table>
								</td>
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
		<area shape="rect" coords="588,21,612,41" href="https://facebook.com/oohoohkse" target="_blank"
			onfocus="this.blur();">
		<area shape="rect" coords="551,21,575,41" href="https://instagram.com/oohoohkse" target="_blank"
			onfocus="this.blur();">
		<area shape="rect" coords="517,21,541,41" href="https://twitter.com/@oohoohkse" target="_blank"
			onfocus="this.blur();">
		<area shape="rect" coords="489,99,610,117" href="#"
			onfocus="this.blur();">
		<area shape="rect" coords="485,21,509,41"
			href="mailto:oohoohkse@gmail.com" target="_blank" onfocus="this.blur();">
	</map>
</body>
</html>