<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="load.aspx.cs" Inherits="GeneratePDF.load" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://localhost:62625/ReaderPlus/GetResources?resourceName=P3Rest.ReaderPlusAgent.Resources.Scripts.Production.svg.min.js"></script>
    <script type="text/javascript" src="http://localhost:62625/ReaderPlus/GetResources?resourceName=P3Rest.ReaderPlusAgent.Resources.Scripts.Production.readerplus.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://localhost:62625/ReaderPlus/GetResources?resourceName=P3Rest.ReaderPlusAgent.Resources.Styles.readerplus.css" />

    <script>
        window.onload = function () {
            readerplus.initializeSettings({
                protocol: "http",
                hostname: 'localhost',
                port: 62625,
                language: 'en',
            });


            readerplus.Document.addEventListener("load", function () {
                readerplus.mainmenu.addMenu("Custom");
                readerplus.mainmenu.Custom.addSection("PrintSave");
                readerplus.mainmenu.Custom.PrintSave.addItem("SavePrint", "SavePrint", "/image/p.png", false, "", "", function () {
                    readerplus.Document.save();
                    readerplus.Document.print();
                });
            });

            $.ajax({
                type: "POST",
                url: "load.aspx/GetPDFData",
                data: "{}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: true,
                success: function (data) {
                    var isMasterDocument = 1;
                    var editMode = 1;
                    var result = readerplus.Document.upload(data.d, isMasterDocument, editMode, "", "Test.pdf");
                    if (result.Status === 0) {
                        var docID = readerplus.Document.getDocumentID();
                        readerplus.Document.edit(docID);
                    }
                    else {
                        alert('Document failed to open!')
                        console.error(result.Details);
                    }
                },
                error: function (xhr, status, error) {
                    alert("Document failed to open!");
                }
            });

        }
    </script>
</head>
<body>
    <div id="ReaderPlus" class="readerplus" style="width: 100%; height: 650px"></div>
</body>
</html>
