<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Adding Advertisement Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 36px}
.style2 {
	font-weight: bold;
	font-style: italic;
	color: #000000;
}
.style3 {color: #FF00FF}
.style4 {color: #000000}
.style5 {font-size: 14px}
.style7 {color: #000000; font-weight: bold; }
.style8 {font-weight: bold}
.style9 {color: #FF0000}
-->
</style>
</head>
<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1">Understanding In-app Ads and Detecting Hidden Attacks through the Mobile App-Web Interface</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home Page</span></a></li>
          <li><a href="A_Login.jsp"><span>Admin</span></a></li>
          <li class="active"><a href="U_Login.jsp"><span>User</span></a></li>
          <li></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="320" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="320" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="320" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
	  <h2><span class="style3">Upload Advertisement Details</span></h2>
	  <%
	  		String uname=(String)application.getAttribute("uname");
	  		String fn=request.getParameter("t42");
	  		String acat=request.getParameter("acat");
			String aname=request.getParameter("aname");
			String text=request.getParameter("text");
			String dt=request.getParameter("dt");
			String cname=request.getParameter("cname");
			String cyear=request.getParameter("cyear");
			
	%>  	
        <form name="s" action="U_AddAdv2.jsp" method="post" enctype="multipart/form-data" onSubmit="return valid()"  ons target="_top">
                    <p>&nbsp;</p>
                    <table width="600" border="0" align="center">
					
					<tr>
                        <td height="36" ><span class="style5 style4 style8"><strong>Advertisement Category :-</strong></span></td>
                        <td>
						<input name="acat" type="text" id="acat" value=<%=acat%> />						</td>
                      </tr>
					 
					  <tr>
                        <td height="36" ><span class="style5 style4 style8"><strong>Advertisement Name :-</strong></span></td>
                        <td width="230">
						  <span class="style7">
						  <textarea name="aname" id="aname" cols="30" rows="1"><%=aname%></textarea>
					    </span> </td>
                      </tr>
					
                     <tr>
                        <td height="36" ><span class="style5 style4 style8"><strong>File Name :-</strong></span></td>
                        <td width="230">
						  <span class="style7">
						  <textarea name="fn" id="fn" cols="30" rows="1"><%=fn%></textarea>
					    </span> </td>
                      </tr>
					 
					  <tr>
                        <td height="42" ><span class="style5 style4 style8"><strong>Document content :- </strong></span></td>
                        
                        <td><span class="style7">
                          <textarea name="text" id="textarea" cols="50" rows="5"><%=text%></textarea>
                        </span></td>
                      </tr>
                  		
						 <tr>
                        <td height="36" ><span class="style5 style4 style8"><strong>Advertise Date :-</strong></span></td>
                        <td>
						<textarea name="dt" type="text" id="dt" ><%=dt%></textarea>						</td>
                      </tr>
						
				  		 <tr>
                        <td height="36" ><span class="style5 style4 style8"><strong>Company Name :-</strong></span></td>
                        <td>
						<textarea name="cname" type="text" id="cname" ><%=cname%></textarea>							</td>
                      </tr>
					  
					  <tr>
                        <td height="36" ><span class="style5 style4 style8"><strong>Company Estimation Year :-</strong></span></td>
                        <td>
						<input name="cyear" type="text" id="cyear" value=<%=cyear%> />						</td>
                      </tr>
					  
					   <tr>
                        <td height="36" ><span class="style5 style4 style8"><strong>Product Image:-</strong></span></td>
                        <td>
						<input name="pic" type="file" class="file " id="pic" required />						</td>
                      </tr>
				  
                      <tr>
                        <td><div align="right"></div></td>
                        <td><input name="Submit" type="submit" value="Upload" /></td>
                      </tr>
                    </table>
        </form>      <p>&nbsp;</p>
		<p align="right"><a href="U_AddAdv0.jsp">Back</a></p>
		
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <ul class="sb_menu style2">
            <li><a href="U_Main.jsp">User Home</a></li>
            <li><a href="U_Login.jsp">LogOut</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"><a href='http://all-free-download.com/free-website-templates/'></a></div>
    </div>
  </div>
</div>
</body>
</html>
