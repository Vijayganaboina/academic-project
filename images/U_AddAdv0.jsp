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
.style8 {color: #000000; font-weight: bold; font-size: 14px; }
.style9 {font-size: 14px}
.style11 {color: #FF00FF}
.style12 {color: #FF0000}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
<script language="javascript" type="text/javascript">
function valid()
{
var na3=document.s.acat.value;
if(na3=="")

{
alert("Please Enter Category");
document.s.acat.focus();
return false;
}
var na31=document.s.aname.value;
if(na31=="")

{
alert("Please Enter Advertisement Name");
document.s.aname.focus();
return false;
}

var na3=document.s.t42.value;
if(na3=="--Select--")

{
alert("Please Select File");
document.s.t42.focus();
return false;
}

var na4=document.s.cname.value;
if(na4=="")

{
alert("Please Enter Company Name");
document.s.cname.focus();
return false;
}
var na4=document.s.cyear.value;
if(na4=="")

{
alert("Please Enter Company Estimation Year");
document.s.cyear.focus();
return false;
}

}
</script>
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
        <div class="article">
          <h2><span class="style11">Upload Advertisement Details</span></h2>
		 
	<%
      try 
		{
      		 String uname=(String)application.getAttribute("uname");

			String query8="select * from advrequest where uname='"+uname+"' "; 
			Statement st8=connection.createStatement();
		 	ResultSet rs8=st8.executeQuery(query8);
			if ( rs8.next() )
			{	
								
	   			String date11=rs8.getString(3);
				String date21=rs8.getString(4);	
				
				String query="select * from advrequest where uname='"+uname+"' and status='permitted' "; 
				Statement st=connection.createStatement();
		 		ResultSet rs=st.executeQuery(query);
				if ( rs.next() )
				{	
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

			Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(date21);
			Date date3 = new SimpleDateFormat("dd/MM/yyyy").parse(date11);
			Date now1 = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
			String strCurrDate = sdf1.format(now1);
			Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(strCurrDate);

			if (date1.compareTo(date2) < 0)
   								{
						%><h3 class="style12">Your advertisement Date Has Expired</h3><%
         								}
			else if (date3.compareTo(date2) > 0)
   								{
						%><h3 class="style12">Your Date For Advertisement have not come wait till <%=date11%></h3><%
         	}
			else{
	 %>
	 
	  <form name="s" action="U_AddAdv1.jsp" method="post" onSubmit="return valid()"  ons target="_top">
                    <p>&nbsp;</p>
                    <table width="600" border="0" align="center">
					<tr>
                        <td height="36" ><span class="style8">Advertisement Category :-</span></td>
                        <td>
						<input type="text" name="acat" id="acat" />						</td>
                      </tr>
					  <tr>
                        <td height="36" ><span class="style8">Advertisement Name :-</span></td>
                         <td><input type="text" name="aname" id="aname" /></td>
                      </tr>
					
                      <tr>
                        <td width="286" height="37"><span class="style8">Select Desription File :-</span></td>
                        <td width="356"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
                      </tr>
                      
                      <tr>
                        <td height="42" ><span class="style8">Document content :- </span></td>
                        
                        <td><textarea name="text" id="textarea" cols="50" rows="5"></textarea></td>
                      </tr>
                  		
						 <tr>
                        <td height="36" ><span class="style8">Advertise Date with Time:-</span></td>
                        <td>
						<textarea type="text" name="dt" id="dt" ><%=strCurrDate%></textarea>						</td>
                      </tr>
						
				  		 <tr>
                        <td height="36" ><span class="style8">Company Name :-</span></td>
                        <td><input type="text" name="cname" id="cname" /></td>
                      </tr>
					  
					  <tr>
                        <td height="36" ><span class="style8">Company Estimation Year :-</span></td>
                        <td>
						<input type="text" name="cyear" id="cyear" />						</td>
                      </tr>
				  
                      <tr>
                        <td><div align="right"><span class="style9"></span></div></td>
                        <td><input type="submit" name="Submit" value="Upload" /></td>
                      </tr>
                    </table>
        </form>      <p>&nbsp;</p>
       
	   <%
          }
		  } else{%><h3>Please Wait For Admin Permission Thank you</h3><%}
		  } else{%><h3>Please Ask Permission For Advertisement</h3><%}
		   connection.close();
		  }
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
	%>
	   
	   <p align="right"><a href="U_Main.jsp">Back</a></p> 
        </div>
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
