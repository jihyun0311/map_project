<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="02_00_map.css" rel="stylesheet">
</head>
<body>
	<div class="main">
		<h1 class="title">지역을 선택해주세요!</h1>
			<div id="map" style="border-radius:15px">
			</div>
	</div>
  
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b49786653b9df59dadb507a3ee35cde6"></script>
  <script src="02_00_map.js"></script>
</body>
</html>