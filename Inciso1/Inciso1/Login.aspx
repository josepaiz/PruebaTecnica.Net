<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Inciso1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
    <link href="css/Login.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body>
        <div class="wrapper">
            <div class="formcontent">
                <form id="frm_login" runat="server">
                    <div class="form-control">
                        <div class="col-md-6 text-center mb-5">
                            <asp:Label class="h2" ID="lblLogin" runat="server" Text="Login"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="lblUser" runat="server" Text="Usuario"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtUser" runat="server" placeholder="Usuario"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label  ID="lblMessageUser" runat="server" ></asp:Label>
                        </div>
                        <br/>
                        <div>
                            <asp:Label ID="lblPwd" runat="server" Text="Contrasena"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtPwd" runat="server" TextMode="Password" placeholder="Contrasena"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label  ID="lblMessagePwd" runat="server" ></asp:Label>
                        </div>
                        <br/>
                        <div>
                            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                        </div>
                        <br/>
                        <div class="row">
                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text ="Iniciar Sesion" />
                        </div>
                        <br/>
                        <div class="row">
                            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text ="Registrarse" />
                        </div>

                    </div>
                </form>
            </div>
        </div>

</body>
</html>
