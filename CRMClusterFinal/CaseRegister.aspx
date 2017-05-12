<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CaseRegister.aspx.cs" Inherits="CRMClusterFinal.CaseRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cases - Register</title>
    <link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="css/Layout.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <header>
            <div id="header_left">
               <a href="Default.aspx"> <div id="logotype"></div></a>
            </div>
            <div id="header_right"> 
                <div id="login">
                    <div id="loggedin_as"><asp:Label ID="lbLoggedInUserEmail" runat="server" Text=""></asp:Label></div>            
                    <div id="login_menu">
                        <div id="login_button"><asp:Button ID="btnLogin" CssClass="blue_button" runat="server" Text="LOG OUT" OnClick="btnLogin_Click" /></div>                     
                    </div>
                </div>
            </div>
        </header>
        <nav>
            <div id="nav_left">
            <ul>
                <li><a href="CompanyRegister.aspx">Accounts</a></li>
                <li><a href="CaseRegister.aspx">Cases</a></li>
             </ul>
             </div>  
          
            <div id="nav_right">
                <ul>
                <li><a href="#">Settings</a></li>
                <li><a href="Default.aspx">News feed</a></li>
               
            </ul>
            </div>
            

        </nav>
        <main>
 
                
                <%--<div id="form_content">
                    <div id="caseInfo">
                   
                          <table class="formtable">
                            <tr>
                                <td class="forminput"><asp:TextBox ID="tbTitle"  CssClass="tbstyle" placeholder="Title" TabIndex="1"  runat="server"></asp:TextBox></td>
                            </tr>
                              <tr>
                                 <td class="forminput">
                                    <asp:DropDownList  CssClass="tbstyle" ID="ddlAccount" TabIndex="3"  runat="server" >
                                        <asp:ListItem Value="1">Company 1</asp:ListItem>
                                        <asp:ListItem Value="2">Company 2</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="forminput"><asp:TextBox ID="tbDescription"  CssClass="tbstyle" placeholder="Description"  TabIndex="2" runat="server"></asp:TextBox></td>
                            </tr>
                               
                         </table>
                        </div>
                   
                  

                     

                           <table class="formtable">
                            <tr>
                                <td class="formsubmit"><asp:Button ID="btnRegister" CssClass="blue_button"  runat="server" TabIndex="13"  Text="Registrera" OnClick="btnRegister_Click" /></td>
                            </tr>
                        </table>
       
                    
                </div>
           

           --%>

          <div id="form_content">
                    <div id="left_formside">
                        <div id="personal_info">
                        <table class="formtable">
                            <tr> 
                                <td class="forminput"><asp:TextBox ID="tbTitle"  CssClass="tbstyle" placeholder="Title" TabIndex="1"  runat="server"></asp:TextBox></td>
                            </tr>
                             <tr>
                                 <asp:Calendar ID="CTime" runat="server"></asp:Calendar>
                                </td>
                            </tr>
                            
                        </table>
                            <table class="formtable">
                            <tr>
                                <td class="formsubmit"><asp:Button ID="btnRegister" CssClass="blue_button"  runat="server" TabIndex="13"  Text="Registrera" OnClick="btnRegister_Click" /></td>
                            </tr>
                        </table>
                    </div>
                        </div>

                     
                    <div id="right_formside">
                    <div id="case_info">
                        <table class="formtable">
                             <tr>
                                <td class="forminput"><asp:TextBox ID="tbDescription" CssClass="tbstyle" placeholder="Description"  TabIndex="2" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                            </tr>
                        </table>

                           
                    </div>
                </div>

                    
                </div>
           

           
                    
        </main>
        <footer>
            <div id="copyright">&copy; 2016 Nackademin AB - CRM15. Alla rättigheter reserverade.</div>
        </footer>
    </div>
    </form>   
</body>
</html>