<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register1.aspx.cs" Inherits="CRMClusterFinal.Register1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company - Register</title>
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
                        <div id="login_button"><asp:Button ID="btnlogout" CssClass="blue_button" runat="server" Text="LOG OUT" OnClick="btnlogout_Click" /></div>                     
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
 
                
                <div id="form_content">
                    <div id="left_formside">
                        <div id="personal_info">
                        <table class="formtable">
                            <tr> 
                                <td class="forminput"><asp:TextBox ID="tbCompanyName"  CssClass="tbstyle" placeholder="Company Name" TabIndex="1" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="forminput"><asp:TextBox ID="tbCompanyEmail"  CssClass="tbstyle" placeholder="Company Email" TabIndex="2" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="forminput"><asp:TextBox ID="tbStreet"  CssClass="tbstyle" placeholder="Street Address" TabIndex="3" runat="server"></asp:TextBox></td>
                            </tr>
                               <tr>
                                <td class="forminput">
                                    <asp:TextBox ID="tbZipCode"  CssClass="tbstyle" placeholder="Zipcode" TabIndex="4" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="tbCity"  CssClass="tbstyle" placeholder="City" TabIndex="5" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="forminput">
                                    <asp:DropDownList  CssClass="tbstyle" ID="ddlCountry" runat="server"  TabIndex="6">
                                        <asp:ListItem Value="1">Sweden</asp:ListItem>
                                        <asp:ListItem Value="2">Norway</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                              <tr>
                               
                                <td class="forminput">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="forminput"><asp:TextBox ID="tbPhoneNr"  CssClass="tbstyle" placeholder="Phone" TabIndex="8" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </div>
                        </div>

                     
                    <div id="right_formside">
                    <div id="user_info">
                        <table class="formtable">
                            <tr>
                                <td class="forminput"><asp:TextBox ID="tbContactFirstName"  CssClass="tbstyle" placeholder="Contact First Name" TextMode="Email" TabIndex="9" runat="server"></asp:TextBox></td>
                            </tr>
                                    <tr>
                                <td class="forminput"><asp:TextBox ID="tbContactLastName"  CssClass="tbstyle" placeholder="Contact Last Name" TabIndex="10" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="forminput"><asp:TextBox ID="tbContactPhone"  CssClass="tbstyle" placeholder="Contact Phone Number" TabIndex="11" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                      
                        </table>

                           <table class="formtable">
                            <tr>
                                <td class="formsubmit"><asp:Button ID="btnRegister" CssClass="blue_button"  runat="server" TabIndex="13"  Text="Registrera" OnClick="btnRegister_Click" /></td>
                            </tr>
                        </table>    
                         <div id="loginerror"><asp:Label ID="lbErrorMessage" runat="server" Text=""></asp:Label></div>
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
