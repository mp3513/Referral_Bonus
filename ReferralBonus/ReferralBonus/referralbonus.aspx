<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="referralbonus.aspx.cs" Inherits="ReferralBonus.referralbonus" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>

    <script>
        function ValidateFileSize(source, arguments)
        {
             arguments.IsValid = false;
             var size = document.getElementById("<%#FileUpLoad1.ClientID%>").files[0].size;
            if (size >= 204800)
                        {
                        arguments.IsValid = false;
                         return false;

                        }
                 else {

                            arguments.IsValid = true;
                            return true;

                      }
        }
            

    </script>

<style>
.txtbox
{
    width:230px;
}
</style>

</head>
<body>
    
    <form id="form1" runat="server">
    <div>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
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

  
           <p align="center" style="text-align:center;" width:100%;">
            <b ><span>What are you waiting for? Earn that extra cash now and claim your MONEY!</span></b></p>
      

    
        <asp:Table ID="Table1" runat="server" align="center" Width="40%" BorderColor="#C0C0C0">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="2"><asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Who are you referring?"></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="2"><hr noshade color="#C0C0C0" size="1"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
            <asp:TableCell runat="server"  ColumnSpan ="2">
                                     
            </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredValidator" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox1" Text="required" InitialValue="Helli" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="  Invalid Characters" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox1" ValidationExpression="^[a-zA-Z''-'\s]{1,25}$" ForeColor="red"  Font-Bold="true"></asp:RegularExpressionValidator>
                </asp:TableCell>

                <asp:TableCell runat="server"><asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="  Invalid Characters" ValidationGroup="CustomerNameValidation"  ControlToValidate="TextBox1" ValidationExpression="[aA-zZ]" ForeColor="red"  Font-Bold="true"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow runat="server">
                <asp:TableCell runat="server"> <asp:TextBox CssClass="txtbox" ID="TextBox1" runat="server" autocomplete="off" MaxLength="25"></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox CssClass="txtbox" ID="TextBox2" runat="server" autocomplete="off"></asp:TextBox></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:Label ID="Label4" runat="server" Text="Email"></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="  Invalid Email Address" ValidationGroup="CustomerNameValidation"  ControlToValidate="TextBox3" ValidationExpression="([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})" ForeColor="red"  Font-Bold="true"></asp:RegularExpressionValidator>
       
                </asp:TableCell>

                <asp:TableCell runat="server"><asp:Label ID="Label5" runat="server" Text="Phone No."></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                          <ajax:MaskedEditExtender ID="MaskedEditExtender2" runat="server" TargetControlID="TextBox4" Mask="999-999-9999" ClearMaskOnLostFocus="false" MessageValidatorTip="true" MaskType="None" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="Left"  ErrorTooltipEnabled="True" />
                          <ajax:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                                    ControlExtender="MaskedEditExtender2"
                                                    ControlToValidate="TextBox4"
                                                    InitialValue="___-___-____"
                                                    IsValidEmpty="False" ValidationExpression ="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                                                    EmptyValueMessage="input is required"
                                                    InvalidValueMessage="input is invalid"
                                                    Display="Dynamic"
                                                    ForeColor="red"  Font-Bold="true"
                                                    EmptyValueBlurredText=" required"
                                                    InvalidValueBlurredMessage=" Invalid number"
                                                    ValidationGroup="CustomerNameValidation" />        


                </asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:TextBox CssClass="txtbox" ID="TextBox3"  runat="server" autocomplete="off"></asp:TextBox></asp:TableCell><asp:TableCell runat="server"><asp:TextBox CssClass="txtbox" ID="TextBox4"  runat="server" autocomplete="off" ValidationGroup="CustomerNameValidation" ></asp:TextBox></asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="2"> 
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="  Please select valid word file" ControlToValidate="FileUpLoad1" ValidationGroup="CustomerNameValidation"   ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx)$" ForeColor="red"  Font-Bold="true"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator3"   ValidationGroup="CustomerNameValidation" ForeColor="Red" runat="server" ClientValidationFunction="ValidateFileSize" ToolTip="file size must not exceed 2MB"  ErrorMessage="file size must not exceed 2MB." OnServerValidate="ValidateFileSize" />
                    </asp:TableCell></asp:TableRow><asp:TableRow runat="server" >
                  <asp:TableCell runat="server" ColumnSpan="2"> 
                    <asp:FileUpLoad ID="FileUpLoad1" runat="server"  accept="application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" /><small>Attach resume-You can upload your resume in .doc or .docx format</small>           
                </asp:TableCell></asp:TableRow><asp:TableRow runat="server" >
                <asp:TableCell runat="server"><asp:Label ID="Label7" runat="server" Text="Notes" ></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ValidationGroup="CustomerNameValidation" ControlToValidate="TextArea1" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                </asp:TableCell></asp:TableRow><asp:TableRow runat="server" >
                <asp:TableCell runat="server" ColumnSpan="2"> <textarea id="TextArea1" runat="server" rows="3" cols="80" autocomplete="off"></textarea></asp:TableCell></asp:TableRow></asp:Table><br />
   
      
        <asp:Table ID="Table2" runat="server" align="center" Width="40%"  >

            <asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="2"><asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Please enter your information in order to receive your bonus"></asp:Label></asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="2"><hr noshade color="#C0C0C0" size="1"></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:Label ID="Label9" runat="server" Text="First Name"></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="  Invalid Characters" ControlToValidate="TextBox7" ValidationGroup="CustomerNameValidation"   ValidationExpression="[aA-zZ]" ForeColor="red"  Font-Bold="true"></asp:RegularExpressionValidator>
                </asp:TableCell><asp:TableCell runat="server"><asp:Label ID="Label10" runat="server" Text="Last Name"><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label></asp:Label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="  Invalid Characters" ControlToValidate="TextBox8" ValidationGroup="CustomerNameValidation"  ValidationExpression="[aA-zZ]" ForeColor="red"  Font-Bold="true"></asp:RegularExpressionValidator>
                </asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                <asp:TableCell runat="server"> <asp:TextBox ID="TextBox7" runat="server" CssClass="txtbox" autocomplete="off"></asp:TextBox></asp:TableCell><asp:TableCell runat="server"><asp:TextBox ID="TextBox8" runat="server" CssClass="txtbox" autocomplete="off"></asp:TextBox></asp:TableCell></asp:TableRow><asp:TableRow runat="server">

                <asp:TableCell runat="server"><asp:Label ID="Label11" runat="server" Text="Email"></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="  Invalid Email Address" ValidationGroup="CustomerNameValidation"  ControlToValidate="TextBox9" ValidationExpression="([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})" ForeColor="red"  Font-Bold="true"></asp:RegularExpressionValidator>
                </asp:TableCell><asp:TableCell runat="server"><asp:Label ID="Label12" runat="server" Text="Phone No."></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label>
                    <ajax:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="TextBox10" Mask="999-999-9999" ClearMaskOnLostFocus="true" MessageValidatorTip="true" MaskType="None" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="Left"  ErrorTooltipEnabled="True" />
                          <ajax:MaskedEditValidator ID="MaskedEditValidator1" runat="server"
                                                    ControlExtender="MaskedEditExtender1"
                                                    ControlToValidate="TextBox10"
                                                    IsValidEmpty="true" ValidationExpression ="[0-9]{3}[0-9]{3}[0-9]{4}"
                                                    EmptyValueMessage="input is required"
                                                    InvalidValueMessage="input is invalid"
                                                    Display="Dynamic"
                                                    ForeColor="red"  Font-Bold="true"
                                                    EmptyValueBlurredText=" required"
                                                    InvalidValueBlurredMessage=" Invalid number"
                                                    ValidationGroup="CustomerNameValidation" /> 
                     </asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:TextBox ID="TextBox9" runat="server" CssClass="txtbox" autocomplete="off"></asp:TextBox></asp:TableCell><asp:TableCell runat="server"><asp:TextBox ID="TextBox10" runat="server" CssClass="txtbox" autocomplete="off" MaxLength="10"></asp:TextBox></asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                  <asp:TableCell runat="server" ColumnSpan="2"> <asp:Label ID="Label14" runat="server" Text="Enter Below Code: "></asp:Label><asp:Label runat="server" ForeColor="#FF0000">*</asp:Label><asp:Label runat="server" ID="Label20" ForeColor="Red" Font-Bold="true" ></asp:Label>
                      <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox11" Display="Dynamic" ErrorMessage="  required" ForeColor="red"  Font-Bold="true" ></asp:RequiredFieldValidator>
                      <asp:CompareValidator runat="server" ID="CompareValidator1" ValidationGroup="CustomerNameValidation" ControlToValidate="TextBox11" ControlToCompare="TextBox20" operator="Equal" ErrorMessage="Invalid Captcha" ForeColor="Red" Font-Bold="true"></asp:CompareValidator>
                 
                  </asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                  <asp:TableCell runat="server" > <asp:TextBox ID="TextBox11" runat="server" autocomplete="off"></asp:TextBox></asp:TableCell><asp:TableCell runat="server" ><asp:TextBox runat="server" ID="TextBox20" Text='<%#Session["captcha"]%>' Visible="true"></asp:TextBox></asp:TableCell></asp:TableRow><asp:TableRow runat="server">
                
                  <asp:TableCell runat="server" ><asp:Image ID="imgCaptcha" runat="server" /> &nbsp; <asp:ImageButton ID="header1" ImageUrl="refresh.png" runat="server" OnClick="btnRefresh_Click" /> </asp:TableCell><asp:TableCell runat="server" HorizontalAlign="Right"><asp:Button runat="server" OnClick="Button1_Click" height="30px" Width="75px" Text="Submit" ValidationGroup="CustomerNameValidation"  AutoPostback="false" /></asp:TableCell>        
            </asp:TableRow>
           
        </asp:Table></div>

          </form>
</body>
</html>

