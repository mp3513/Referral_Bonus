<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="referralbonusconfirm.aspx.cs" Inherits="ReferralBonus.referralbonusconfirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <% if (retvalue == 0)
         {
             mail(email);
    %>
    
        <asp:Table ID="Table1" runat="server" Width="479px"  align="center">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><p><font face="Arial" size="4"><b>Thank You</b></font></p>
                <p>Your referral has been submitted to recruiter</p>              
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
            </asp:TableRow>
        </asp:Table>
<%
    }
    else 
    { %>
          <asp:Table ID="Table2" runat="server" Width="479px"  align="center">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                <p>The link you clicked is either expired or invalid</p>
                <p>Please check the link or refer your friend again.</p>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
            </asp:TableRow>
        </asp:Table>
        <% } %>


    </div>
    </form>
</body>
</html>
