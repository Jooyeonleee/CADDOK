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
										src="images/clustering.png" width="120" height="12" alt="">
									</td>
								</tr>
								<tr>
									<td height="100" valign="top"
										style="padding-top: 10px; line-height: 20px;"><br>
										<div id="donut" style="height: 300px;"></div>
										<script>
										new Morris.Donut({
											  element: 'donut',
											  data: [
											    {label: "고객 유형: AAAAAAAAAA", value: 63.9},
											    {label: "고객 유형: ABCBBABBBA", value: 21.8},
											    {label: "고객 유형: ABACCCDCDE", value: 14.2}
											  ]
											});
									</script><br><br><center>
										<span style="font-family:나눔스퀘어; line-height:200%">
										<font size="4px">카페고객에 대한 구매 유형을 분석할 수 있습니다.</font><br>
										<font size="4px">고객의 과거 구매이력을 분석하여 어떤 구매 유형의 고객들이 존재하는지 보여줍니다.</font><br><br>
										<font size="2px">
										Ex) AAAAA : 1가지 메뉴를 먹는 사람입니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ABABAB : 2가지 메뉴를 번갈아가며 먹는 사람입니다.<br><br>
										</font>
										<font size="3px">
										<% 
										BufferedReader reader = null;
										try {
											reader = new BufferedReader(new FileReader("C:\\Users\\smu\\clustering_output.txt"));
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
										}%></font><br>
										<font size="2px" color="FF0072">&nbsp;&nbsp;* 각 알파벳은 A,B,C는 메뉴의 종류를 의미합니다.</font><br><br>
										</span></center>
									</td>
								</tr>
							<tr>
								<td height="16" colspan="3" align="left" valign="top"
									style="border-bottom: 1px #ededed solid;">
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