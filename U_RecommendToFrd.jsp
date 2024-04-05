<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Recommend To Friends</title>
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
.style3 {color: #006600}
.style4 {color: #FF0000}
.style5 {color: #FF00FF}
-->
</style>
</head>
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
	  <%@ include file="connect.jsp" %>
 <%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%> 
        <h2>Recommend To Friend Status</h2>
		<%
try {
            
            SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
String user=(String)application.getAttribute("uname");
String aname=request.getParameter("title");
int id=Integer.parseInt(request.getParameter("id")); 
String name=request.getParameter("recommendto");

                Statement stmt1=connection.createStatement();
				String strQuery1 = "select * from recommendtofriend where recommendfrom ='"+user+"' && recommendto ='"+name+"' && aname='"+aname+"' ";
				ResultSet rs1 = stmt1.executeQuery(strQuery1);
				if(rs1.next())
				{
						
						%><h3 class="style5">Already Recommended this Advertisement</h3>
						<br/><br/><p align="right"><a href="U_RecommendAdv.jsp?id=<%=id%>" class="style47">Back</a></p><%
		
				}
				else
				{

PreparedStatement pst=connection.prepareStatement("insert into recommendtofriend(recommendfrom,recommendto,aname,aid,date) values(?,?,?,?,?)");
            
			pst.setString(1,user);
            pst.setString(2,name);
            pst.setString(3,aname);
			pst.setInt(4,id);
            pst.setString(5,dt);

			 int x=pst.executeUpdate();
			
		
					if(x>0)
			{
				
                          %><h3 class="style3">Advertisement Recommended Successfully.</h3>
		                        <p align="right"><a href="U_RecommendAdv.jsp?id=<%=id%>" class="style47">Back</a></p>
                          <%
								
			}
			else
			{
						%> 
  </h2>
  <div align="center"><br />
	  <h3>  <span class="style4">Recommend Not Successfull, Please try agian!!!        </span> </h3> </div>
      </div>
						  <p align="right"><a href="U_RecommendAdv.jsp?id=<%=id%>" class="style47">Back</a></p>
						<div align="center">
						  <%
			}
			
		} }
		catch (Exception e) {
		e.printStackTrace();
		}	
			
			

%>
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
