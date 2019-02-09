<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GeneratePDF.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" /><asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        </div>
        <p>
            <asp:Image ID="imgControl" runat="server" Height="377px" Width="825px" />
        </p>
        <p>
            <asp:Button ID="btnGeneratePdf" runat="server" OnClick="btnGeneratePdf_Click" Text="Generate PDF" />
        </p>
    </form>
</body>
</html>
