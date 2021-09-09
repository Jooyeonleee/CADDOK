<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest, 
                           com.oreilly.servlet.multipart.DefaultFileRenamePolicy, 
                           java.io.File" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<body>  
<%  
String savePath=application.getRealPath("");     // 업로드 파일을 저장할 폴더 지정  
int sizeLimit = 5 * 1024 * 1024 ;      // 5메가까지 제한 넘어서면 예외 발생  

MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());     // 파일 업로드는 이 시점에 이루어짐 

File file = multi.getFile("Excelfile");      // 파일의 이름 얻어옴 
String fileName=file.getName();  
long fileSize=file.length(); 

if(fileName == null) {     // 파일이 업로드 되지 않았을 때 
   out.print("파일 업로드 되지 않았음 (이유: 파일 사이즈 초과 등)"); 
} else {  
   out.print("User Name : " + multi.getParameter("username") + "<br>");  
   out.print("File Name : " + fileName + "<br>"); 
   out.print("File Size : " + fileSize + "<br>"); 
} 

%> 
<script>
	alert("파일이 업로드되었습니다. 분석을 눌러주세요.");
	history.go(-1);
</script>
</body> 
</html> 