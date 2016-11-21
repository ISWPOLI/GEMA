<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CambiarContrasena.aspx.cs" Inherits="CambiarContrasena" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <div class="container">
        <h3 class="text-center">CAMBIAR CONTRASEÑA </h3>
        <div class="row text-right">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblContraseñaAntigua" runat="server" Height="30px" Text="Contraseña Anterior" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:TextBox ID="txtAntiguaContraseña" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
            </div>
        </div>
        <div class="row text-right" style="padding-top:10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblNuevaContraseña" runat="server" Height="30px" Text="Contraseña Nueva" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:TextBox ID="txtContraseñaNueva" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
            </div>
        </div>
        <div class="row" style="padding-top:10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Button ID="btnCambiarContraseña" runat="server" Text="Cambiar Contraseña" CssClass="bnt-block btn btn-primary" Width="100%" />
            </div>
        </div>
    </div>
</asp:Content>
