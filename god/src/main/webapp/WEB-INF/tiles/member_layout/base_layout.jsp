<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<title>Get Out Door</title>

</head>
 
<body>
 
    <!-- header -->
    <nav>
        <tiles:insertAttribute name="member_header" />
    </nav>
 
    <!-- body -->
    <div>
		<tiles:insertAttribute name="body" />
    </div>
 
    <!-- footer -->
    <div>
        <tiles:insertAttribute name="member_footer" />
    </div>
   
</body>
</html>