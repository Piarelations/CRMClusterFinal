<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRMClusterFinal.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default</title>
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
                        <div id="login_button"><asp:Button ID="btnlogout" CssClass="blue_button" runat="server" Text="LOG OUT" OnClick="btnlogout_Click1" /></div>                     
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
                <li><a href="Register.aspx">Register Users</a></li>
                <li><a href="Default.aspx">News feed</a></li>
               
            </ul>
            </div>
            

        </nav>
        <main>
            <div class="main_content">
              <div id="GridView1">
                  <h3>Accounts</h3>
                <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="companyName" HeaderText="Account" SortExpression="companyName" />
                        <asp:BoundField DataField="companyEmail" HeaderText="Email" SortExpression="companyEmail" />
                        <asp:BoundField DataField="companyPhoneNR" HeaderText="Phone" SortExpression="companyPhoneNR" />
                        <asp:BoundField DataField="companyAddress" HeaderText="Address" SortExpression="companyAddress" />
                        <asp:BoundField DataField="employeeID" HeaderText="EmployeeID" SortExpression="employeeID" />
                    </Columns>
                    <EmptyDataRowStyle Wrap="True" />
                </asp:GridView>
              </div>
                <div id="GridView2">
                     <h3>Cases</h3>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT [companyEmail], [companyPhoneNR], [companyAddress], [employeeID], [companyName] FROM [Company]"></asp:SqlDataSource>
                <asp:GridView ID="gvService" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="serviceTitle"  HeaderText="Title" SortExpression="serviceTitle" />
                        <asp:BoundField DataField="descriptionService" HeaderText="Description" SortExpression="descriptionService" />
                        <asp:BoundField DataField="serviceDate" HeaderText="Date" SortExpression="serviceDate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT [descriptionService], [serviceDate], [serviceTitle] FROM [Service]"></asp:SqlDataSource>
            </div>
            </div>
        </main>
        <footer>
            <div id="copyright">&copy; 2016 Nackademin AB - CRM15. Alla rättigheter reserverade.</div></footer>
    </div>
    </form>   
</body>
</html>
