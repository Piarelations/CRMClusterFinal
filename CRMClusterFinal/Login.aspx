<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRMClusterFinal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cluster</title>
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
                         
                </div>
            </div>
        </header>
        <nav>
        
        </nav>
        <main>
            <section id="Login" class="content">
                <div id="loginsection">
                    <div id="loginbox">
                      
                        <div class="logininput"><asp:TextBox ID="tbEmail" CssClass="tbstyle" PlaceHolder="E-postadress" runat="server"></asp:TextBox></div>
                        <div class="logininput"><asp:TextBox ID="tbPassword" CssClass="tbstyle"  PlaceHolder="Lösenord" TextMode="Password" runat="server"></asp:TextBox></div>
                        <div id="loginerror"><asp:Label ID="lbErrorMessage" runat="server" Text=""></asp:Label></div>
                        <div id="loginbutton"><asp:Button ID="btnFormLogin" runat="server" Text="Logga in" CssClass="blue_button longbtn" OnClick="btnFormLogin_Click" /></div>
                        <div id="loginreset"><asp:LinkButton ID="lbtnReset" runat="server" OnClick="lbtnReset_Click">Glömt Lösenordet?</asp:LinkButton></div>
                    </div>                    
                </div>
            </section>
        </main>
        <footer>
            <div id="copyright">&copy; 2016 Nackademin AB - CRM15. Alla rättigheter reserverade.</div>
        </footer>
    </div>
    </form>   
</body>
</html>