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
String savePath=application.getRealPath("");     // ���ε� ������ ������ ���� ����  
int sizeLimit = 5 * 1024 * 1024 ;      // 5�ް����� ���� �Ѿ�� ���� �߻�  

MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());     // ���� ���ε�� �� ������ �̷���� 

File file = multi.getFile("Excelfile");      // ������ �̸� ���� 
String fileName=file.getName();  
long fileSize=file.length(); 

if(fileName == null) {     // ������ ���ε� ���� �ʾ��� �� 
   out.print("���� ���ε� ���� �ʾ��� (����: ���� ������ �ʰ� ��)"); 
} else {  
   out.print("User Name : " + multi.getParameter("username") + "<br>");  
   out.print("File Name : " + fileName + "<br>"); 
   out.print("File Size : " + fileSize + "<br>"); 
} 

%> 
<script>
	alert("������ ���ε�Ǿ����ϴ�. �м��� �����ּ���.");
	history.go(-1);
</script>
</body> 
</html> 