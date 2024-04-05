<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Recommend Advertisement</title>
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
.style4 {font-size: 24px; }
.style5 {color: #FF00FF}
.style6 {font-size: 24px; color: #FF00FF; }
.style7 {font-weight: bold; font-style: italic; color: #FF00FF; }
-->
</style>
<script language="javascript" type="text/javascript">      <!--Start Reg Validation Jai Siddalinga-->
function valid()
{
var na3=document.s.title.value;
if(na3=="")

{
alert("Please Enter Advertisement Name");
document.s.title.focus();
return false;
}
else
{

}
var na4=document.s.recommendto.value;
if(na4=="--select--")

{
alert("Please Choose Your Friends");
document.s.recommendto.focus();
return false;
}
}
</script>
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
        <h2><span class="style7">User Recommend Advertisement</span></h2>
			<p>
			
<%@ include file="connect.jsp" %>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>

					<%
				try 
						{	
				int i1=Integer.parseInt(request.getParameter("id")); 
						String s1="",s2="",s3="",s4="",s5="",s6="";
						int i=0;
						
						   	String query="select * from advertisement where id='"+i1+"' "; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if ( rs.next())
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(3);
								s3=rs.getString(4);
								s4=rs.getString(5);
								s5=rs.getString(12);
							
					%>
					
   

   <form name="s" action="U_RecommendToFrd.jsp?id=<%=i%>" method="post"  onSubmit="return valid()"  ons target="_top">
    
	<table width="511" border="0" align="center"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse; display:inline; margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
 		<tr><td   width="289" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left" class="style4 style5" style="margin-left:20px;">Image : </div></td> <td><input  name="image" type="image" src="images.jsp?value=<%="image"%>&id=<%=i%>" style="width:100px; height:100px;" /></td></tr>
						<td   width="289" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left" class="style4 style5" style="margin-left:20px;">Advertisement Name: </div></td>

						<td  width="222" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left">
						  <div align="left" style="margin-left:20px;"><input type="text" name="title" value="<%=s2%>" readonly="readonly" /></div></td>
					</tr>
					<tr>
                <td   width="289" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left" class="style6" style="margin-left:20px;">Recommend To : </div></td>
                <td  width="222" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left"><div align="left" style="margin-left:20px;">
                  <select name="recommendto" style="width:175px;" >
                  <option>--select--</option>

<%


	int uid=0;
	String uuu=null;
	String uname1 = (String)application.getAttribute("uname");
	Statement stmt1=connection.createStatement();
	String strQuery1 = "select username from user where username!='"+uname1+"' and username!='"+s5+"' ";
	ResultSet rs1 = stmt1.executeQuery(strQuery1);
	while(rs1.next())
	{
		//uid = rs1.getInt(1);
		String username = rs1.getString(1);
		
		
		Statement stmt2=connection.createStatement();
		String strQuery2 = "select requestfrom,requestto from req_res where ((requestfrom ='"+uname1+"' && requestto='"+username+"') ||(requestfrom ='"+username+"' && requestto='"+uname1+"'))and status ='Accepted' ";
		ResultSet rs2 = stmt2.executeQuery(strQuery2);
		while(rs2.next())
		{
		
			if(rs2.getString(1).equals(uname1))
			{
				uuu = rs2.getString(2);
			}
			else
			{
				uuu = rs2.getString(1);
			}
%>
                  <option> <%=uuu%></option>
<%
		}
	}
%>
                </select></td>
              </tr>
					
					<div > <tr><td height="45" colspan="2" id="learn_more" align="center"  style="color:#003399;"><input type="submit" value="Recommend" style="width:100px; height:35px; background-color:#999999; color:#003399;"/></td></tr></div>
          </table>


	 </form>
		  
		  
		  <%
  	}
	%><p align="right"><a href="U_FriendsAdvertisements.jsp" class="style47">Back</a></p><%
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
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
