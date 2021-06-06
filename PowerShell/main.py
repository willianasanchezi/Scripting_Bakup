<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="IPV6 Scanner is a Online Port Scan. Also scans IPV4 ports.">
	<meta name="keywords" content="ipv6, port scan, scanner">
	
	<title>IPV6 Scanner | Online Port Scan</title>
	
	<link type="text/css" rel="stylesheet" href="/main.css">
</head>
<body>
<header>
	<div id="headerTop">
		<div id="headerTopSub">
			<a href="/">
				<span class="white left">IPv6</span><span class="blue">Scanner</span><span class="white left"> Beta</span>
				<a class="white right" href="/contact.html">Contact</a>
			</a>
		</div>
	</div>
</header>

<div id="headerScan">
	<h1>IPv6 Online Port Scanner</h1>
	IPv6Scanner is a
	<a href="http://en.wikipedia.org/wiki/Port_scanner">port scanner</a> that allows you to probe a server for open, closed or filtered ports. You can specify a host name, IPv4 or IPv6 address.
	The purpose of this tool is to enable the administrators to verify security.
	Use with the intent to compromise third-party hosts is not allowed. For this reason the number of systems that can be scanned in a period is limited.
</div>
<div id='container'>
<div id='ipaddress'>Your IP address is 190.9.221.108</div>
<div id="scanForm">
	<form action="/cgi-bin/main.py" method="post">
		<input id="inputHost" type="text" size="42" name="host"
			value="Enter a Host Name, IPv4 or IPv6 Address"
			onfocus="if (this.value == this.defaultValue) {this.value = '';}"
			onblur="if (this.value == '') {this.value = this.defaultValue;}">
		<input id="scanButton" type="submit" value="Scan!" disabled> <br>
		<div class="formKey">Ports:</div>
		<div class="formValue">
		<select id="selectScanType" name="scanType" onchange="if (this.selectedIndex === 1){document.getElementById('inputPort').style.display='block'} else {document.getElementById('inputPort').style.display='none'}">
			<option	value="0">Common server ports</option>
			<option value="1">Specific port</option>
		</select>
		</div>
		<div id="inputPort" style='display:none'>
			<div class="formKey"> Port:</div>
			<div class="formValue"><input id="specificPort" type="text" size="5" name="port" value="80"></div>
		</div>
		<div id="authorization">
			<input type="checkbox" id="cbAuthorized" name="authorized" value="yes" onclick="document.getElementById('scanButton').disabled = !document.getElementById('cbAuthorized').checked;">I am authorized to initiate this port scan.
		</div>
	</form>
</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50372175-1', 'ipv6scanner.com');
  ga('send', 'pageview');

</script>
<script>
document.getElementById('selectScanType').selectedIndex=0
</script>
<script>
document.getElementById('specificPort').value='80';
</script>
</div>
<footer>
	<div id="footerTop">
		IPv6 Scanner is a personal project of Javier Yáñez
	</div>
</footer>
</body></html>
