<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReferralbonusSubmit.aspx.cs" Inherits="ReferralBonus.ReferralbonusSubmit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <p align="center"><asp:ImageButton ID="ImageButton2" ImageUrl="Refer_a_Friend-01.png" runat="server" /></p> 
        <asp:Table ID="Table3" runat="server" Height="150px" Width="55%" align ="center">      
            <asp:TableRow runat="server">
            <asp:TableCell runat="server">  
            <p><span>We are always looking for new talent for contract assignments at leading Fortune 500 companies across the nation!&nbsp;We have new opportunities available every day- who knows these shining stars better than you?</span></p>
            <p><span>The process couldn’t be easier. Just fill out the form below and refer your friends to us so we can get them working. Once they complete the required assignment hours, you get your bonus! It’s that easy</span></p></asp:TableCell>

            <asp:TableCell runat="server" Width="50%"><p>
            <b><span>In order to qualify, the applicant must:</span></b></p>
            <p><span style="font-family: Arial Unicode MS, Lucida Grande">&#10003; </span>List YOU as their referral source on their application form </p>
            <p><span style="font-family: Arial Unicode MS, Lucida Grande">&#10003; </span>Referred employee must work 90 days in order for referee to be eligible for the bonus </p>
            <p><span style="font-family: Arial Unicode MS, Lucida Grande">&#10003; </span>Referred employee must be submitted directly to Acro for consideration</p>
                <p><b align="center">**Refer 3 friends get $1500!**</b></p>
            </asp:TableCell>     
            </asp:TableRow>
        </asp:Table>
    <div>
      <asp:Table ID="Table1" runat="server" Width="479px"  align="center">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><p><font face="Arial" size="4" ><b>Thank You</b></font></p>
                <p>Please click on the link sent to your email address to complete the process.</p></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
