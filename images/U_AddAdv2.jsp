<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Adding Advertisement Insert</title>
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
.style4 {color: #009933}
.style5 {color: #FF0000}
-->
</style>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1"%>
	  <%@ page import="java.io.*" %>
            <%@ page import="java.util.*" %>
            <%@ page import="com.oreilly.servlet.*" %>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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
        <h2><span class="style3">Upload Advertisement Details Status...</span></h2>
                  <p>
                    <%
					/*	String acat=request.getParameter("acat");
			String aname=request.getParameter("aname");
			String text=request.getParameter("text");
			String dt=request.getParameter("dt");
			String cname=request.getParameter("cname");
			String cyear=request.getParameter("cyear");*/	
					
	
		int j=0;
		String uname=(String)application.getAttribute("uname");
		try {		
		
		String uurl=String.valueOf(request.getRequestURL());
		
		
					 ArrayList list = new ArrayList();
					
					ServletContext context = getServletContext();
					
					String dirName =context.getRealPath("Gallery/");
					
					String paramname=null,file="",acat="",aname="",cyear="",descr="",dt="",image=null,cname=null,bin ="",fname="";
				
					FileInputStream fs=null;
					
					File file1 = null;	
					
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024);	
						
						Enumeration params = multi.getParameterNames();
						
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							
							if(paramname.equalsIgnoreCase("acat"))
							{
								acat=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("aname"))
							{
								aname=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("text"))
							{
								descr=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("pic"))
							{
								image=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("dt"))
							{
								dt=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("cname"))
							{
								cname=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("cyear"))
							{
								cyear=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("fn"))
							{
								fname=multi.getParameter(paramname);
							}
							
						}

						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = context.getRealPath("Gallery\\"+image);
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
							
								String ss=fPath;
								FileInputStream fis = new FileInputStream(ss);
								StringBuffer sb1=new StringBuffer();
								int i = 0;
								while ((i = fis.read()) != -1) 
								{
									if (i != -1)
									 {
										//System.out.println(i);
										String hex = Integer.toHexString(i);
										// session.put("hex",hex);
										sb1.append(hex);
										
									
										String binFragment = "";
										int iHex;
			 
										for(int i1= 0; i1 < hex.length(); i1++)
										{
											iHex = Integer.parseInt(""+hex.charAt(i1),16);
											binFragment = Integer.toBinaryString(iHex);
			
											while(binFragment.length() < 4)
											{
												binFragment = "0" + binFragment;
											}
											bin += binFragment;
							
						                }
									}	
									
								}
								
							}		
						}
						
		
						FileInputStream fs1 = null;
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt1 = strDate + "   " + strTime;
		
			
	    int rank=0,rate=0;
		int Accno=0,uamount=0,pprice=0,sub=0;
		String blockdate="";
		
		String query="select * from advrequest where uname='"+uname+"' and status='permitted' "; 
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(query);
			if ( rs.next() )
			   {
			    String query1="select * from Advertisement where advname='"+aname+"' and username='"+uname+"' "; 
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(query1);
					if ( rs1.next() )
					   {
					   		%>
            <p align="center" class="style24 style31 style3">Advertisement Already Exist..</p>
              <%
					   }
					   else
					   {
						
						String leftamount=String.valueOf(sub);
						String sql2="Update account set amount='"+leftamount+"'  where user='"+uname+"' ";
						Statement stmt2 = connection.createStatement();
						stmt2.executeUpdate(sql2);
						
						if ((fname.toLowerCase().endsWith(".ade")
              					|| fname.toLowerCase().endsWith(".adp")
              					|| fname.toLowerCase().endsWith(".bas")
              					|| fname.toLowerCase().endsWith(".bat")
              					|| fname.toLowerCase().endsWith(".chm")
              					|| fname.toLowerCase().endsWith(".cmd")
              					|| fname.toLowerCase().endsWith(".com")
              					|| fname.toLowerCase().endsWith(".crt")
              					|| fname.toLowerCase().endsWith(".dll")
              					|| fname.toLowerCase().endsWith(".do*")
              					|| fname.toLowerCase().endsWith(".hlp")
              					|| fname.toLowerCase().endsWith(".hta")
              					|| fname.toLowerCase().endsWith(".inf")
              					|| fname.toLowerCase().endsWith(".ins")

              					|| fname.toLowerCase().endsWith(".js")
              					|| fname.toLowerCase().endsWith(".jse")
              					|| fname.toLowerCase().endsWith(".lnk")
              					|| fname.toLowerCase().endsWith(".md*")
              					|| fname.toLowerCase().endsWith(".msc")
              					|| fname.toLowerCase().endsWith(".msi")
              					|| fname.toLowerCase().endsWith(".mst")
              					|| fname.toLowerCase().endsWith(".ocx")
              					|| fname.toLowerCase().endsWith(".pcd")
              					|| fname.toLowerCase().endsWith(".pif")
              					|| fname.toLowerCase().endsWith(".pot")
              					|| fname.toLowerCase().endsWith(".reg")
              					|| fname.toLowerCase().endsWith(".scr")
              					|| fname.toLowerCase().endsWith(".sct")
              					|| fname.toLowerCase().endsWith(".shb")
              					|| fname.toLowerCase().endsWith(".shs")
              					|| fname.toLowerCase().endsWith(".sys")
              					|| fname.toLowerCase().endsWith(".url")||fname.toLowerCase().endsWith(".ade")))
                      					 {
							String ip = request.getRemoteAddr();
							
							String type="Malware";
							String state="unblock";
						
				String query4="select * from evidence where uname='"+uname+"' and type='"+type+"' "; 
				Statement st4=connection.createStatement();
				ResultSet rs4=st4.executeQuery(query4);
					if ( rs4.next() )
					{out.print("You Are Already Malacius User");}
					else{
					
					String acctype1="Malacious";
					
					String sql6="Update user set acctype='"+acctype1+"' where username='"+uname+"' ";
					Statement stmt6 = connection.createStatement();
					stmt6.executeUpdate(sql6);
					
			Statement st31 = connection.createStatement();
			String query31 ="insert into evidence values('"+type+"','"+uname+"','"+ip+"','"+dt1+"','"+state+"','"+blockdate+"','"+uurl+"')";
			st31.executeUpdate (query31);
			}
					%>
              <h3 class="style5">You Have Become Malacious User By Trying To Add Malacious File!!!</h3>
              <%
								}
							else{	
						
					 rank=0; rate=0;
	    PreparedStatement ps=connection.prepareStatement("insert into  Advertisement(advcat,advname,comname,cestyear,descr,filename,date,image,rank,rate,username) values (?,?,?,?,?,?,?,?,?,?,?)"); 
				
						ps.setString(1,acat);
						ps.setString(2,aname);	
						ps.setString(3,cname);
						ps.setString(4,cyear);
						ps.setString(5,descr);
						ps.setString(6,fname);
						ps.setString(7,dt);
						ps.setBinaryStream(8, (InputStream)fs, (int)(file1.length()));	
						ps.setInt(9,rank);
						ps.setInt(10,rate);
						ps.setString(11,uname);
						
						if(f == 0)
							ps.setObject(8,null);
						else if(f == 16)
						{
							fs1 = (FileInputStream)list.get(0);
							ps.setBinaryStream(8,fs1,fs1.available());
						}	
						int x=ps.executeUpdate();
				
		%>
</p>
                  <h3 >&nbsp;</h3>
                  <h3 class="style4" >Advertisement Uploaded Sucessfully !</h3>
                  <p class="style30">&nbsp;</p>
                  </p>
                  <%
			}	  
		}
	}else{out.print("Admin Have Not Permitted Wait For Permission");}
	
		connection.close();
		}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>

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
