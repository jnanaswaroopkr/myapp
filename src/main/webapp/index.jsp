<html>
<head>
<title>Welcome to Netflix!</title>
</head>
<body>
	<h1>Please select the following categories!</h1>
	<h2>1.Drama</h2>
	<h2>2.Vengful</h2>
	<h2>3.Horror</h2>
	<h2>4.Anime</h2>
	<h2>5.Comedy</h2>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>
