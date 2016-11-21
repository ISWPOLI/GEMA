<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminUsuarios.aspx.cs" Inherits="AdminUsuarios" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <h3 class="text-center">ADMINISTRACIÓN DE USUARIOS</h3>
    <div class="container">
        <asp:Panel ID="panelGrillaUsuarios" runat="server">
            <div class="row">
                <telerik:RadGrid ID="RadGridUsuarios"
                    runat="server"
                    DataSourceID="SqlDataSource1"
                    AutoGenerateColumns="false"
                    AllowMultiRowSelection="True"
                    SelectedItemStyle-BackColor="Blue"
                    SelectedItemStyle-ForeColor="White"
                    ClientSettings-Selecting-AllowRowSelect="true"
                    AllowFilteringByColumn="true"
                    AllowPaging="true"
                    AllowSorting="true">
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings>
                        <Scrolling AllowScroll="true" />
                        <Selecting UseClientSelectColumnOnly="true" AllowRowSelect="true" />
                    </ClientSettings>
                    <MasterTableView CommandItemDisplay="None">
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="carga" HeaderText="Cga Suelta" ColumnGroupName="carga">
                                <HeaderStyle Width="30px" />
                            </telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn DataField="NombresPersona" HeaderText="Nombres" HeaderStyle-Width="20px" ItemStyle-Width="20px" FooterStyle-Width="20px" />
                            <telerik:GridBoundColumn DataField="ApellidosPersona" HeaderText="Apellidos" />
                            <telerik:GridBoundColumn DataField="CorreoElectronico" HeaderText="Correo Electronico" />
                            <telerik:GridBoundColumn DataField="Usuario" HeaderText="Usuario" />
                            <telerik:GridBoundColumn DataField="roleName" HeaderText="Rol" />
                            <telerik:GridBoundColumn DataField="TipoDocumento" HeaderText="Tipo Documento" />
                            <telerik:GridBoundColumn DataField="NumeroDocumento" HeaderText="Número Documento" />
                            <telerik:GridCheckBoxColumn DataField="Estado" HeaderText="Estado" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <%--<telerik:RadGrid ID="RadGridUsuarios" GridLines="None" runat="server"
                    AllowSorting="True"
                    ShowStatusBar="true"
                    AllowPaging="True"
                    DataSourceID="SqlDataSource1"
                    AllowFilteringByColumn="True"
                    CellSpacing="0"
                    Culture="es-ES"
                    AutoGenerateColumns="false">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" UseClientSelectColumnOnly="true"></Selecting>
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>
                    <SelectedItemStyle BackColor="SkyBlue" BorderColor="Purple" BorderStyle="Dashed" BorderWidth="1px" />
                    <MasterTableView CommandItemDisplay="None"
                        EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                        NoMasterRecordsText="No hay registros para mostrar."
                        CommandItemSettings-RefreshText="Actualizar"
                        CommandItemSettings-ShowAddNewRecordButton="false"
                        CommandItemSettings-ShowRefreshButton="false"
                        CommandItemSettings-AddNewRecordText="Agregar" CommandItemStyle-CssClass="boton">
                        <Columns>
                            <telerik:GridBoundColumn DataField="NombresPersona" HeaderText="Nombres" HeaderStyle-Width="20px" ItemStyle-Width="20px" FooterStyle-Width="20px" SortExpression="nombre" UniqueName="nombre" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="ApellidosPersona" HeaderText="Apellidos" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" SortExpression="apellido" FilterControlAltText="apellido" UniqueName="apellido" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="CorreoElectronico" HeaderText="Correo Electronico" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" FilterControlAltText="correoElectronico" UniqueName="correoElectronico" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="Usuario" HeaderText="Usuario" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" FilterControlAltText="usuario" UniqueName="usuario" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="roleName" HeaderText="Rol" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="300px" FilterControlAltText="roleName" UniqueName="roleName" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="TipoDocumento" HeaderText="Tipo Documento" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" FilterControlAltText="tipodoc" UniqueName="tipodoc" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="NumeroDocumento" HeaderText="Número Documento" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" FilterControlAltText="numdoc" UniqueName="numdoc" AutoPostBackOnFilter="true" />
                            <telerik:GridCheckBoxColumn DataField="Estado" HeaderText="Estado" UniqueName="estado" AutoPostBackOnFilter="true" />
                        </Columns>
                        <EditFormSettings>
                            <FormTableItemStyle Wrap="False" />
                            <FormCaptionStyle CssClass="EditFormHeader" />
                            <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" GridLines="None" Width="100%" />
                            <FormTableStyle BackColor="white" ForeColor="Black" Font-Bold="true" CellPadding="2" CellSpacing="0" Height="110px" />
                            <FormTableAlternatingItemStyle Wrap="false" />
                            <FormTableItemStyle Wrap="false" />
                            <EditColumn ButtonType="PushButton" CancelText="Cancelar" UpdateText="Actualizar" InsertText="Guardar" UniqueName="EditCommandColumn1">
                            </EditColumn>
                            <FormTableButtonRowStyle HorizontalAlign="Left" />
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>--%>
            </div>
            <div class="row" style="padding-top: 10px">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnNuevoUsuario" runat="server" Text="Agregar Usuario" CssClass="btn-block btn btn-primary" OnClick="btnNuevoUsuario_Click" />
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
                SelectCommand=" select * from usuario" />
            <asp:SqlDataSource ID="DataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
                SelectCommand=" select 1 RoleId, 'Administrador' RoleName from usuario">
                <SelectParameters>
                    <asp:SessionParameter SessionField="Usuario" Name="Usuario" Type="string" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter SessionField="Usuario" Name="Usuario" Type="string" />
                    <asp:Parameter Name="estado" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="panelAgregarUsuario" runat="server" Visible="false">
            <h3 class="text-center">INFORMACIÓN USUARIO</h3>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="lblNombre" runat="server" Height="30px" Text="Nombre" Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="lblApellido" runat="server" Height="30px" Text="Apellido" Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="lblCorreo" runat="server" Height="30px" Text="Correo Electronico" Width="120px"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="lblUSuario" runat="server" Height="30px" Text="Usuario" Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="lblRol" runat="server" Height="30px" Text="Rol " Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <telerik:RadComboBox ID="cboRol" runat="server" DataTextField="RoleName" DataValueField="Roleid" AutoPostBack="true"
                        AppendDataBoundItems="true" Width="100%" DataSourceID="DataSourceRoles">
                        <Items>
                            <telerik:RadComboBoxItem Text="Seleccione..." Value="0" Selected="true" />
                        </Items>
                    </telerik:RadComboBox>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="lblTipoDocumento" runat="server" Height="30px" Text="Tipo Documento " Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <telerik:RadComboBox ID="cboTipoDocumento" runat="server" AppendDataBoundItems="true" Width="100%">
                        <Items>
                            <telerik:RadComboBoxItem Text="Seleccione..." Value="0" Selected="true" />
                            <telerik:RadComboBoxItem Text="CC" Value="CC" />
                            <telerik:RadComboBoxItem Text="NIT" Value="NIT" />
                            <telerik:RadComboBoxItem Text="DNI" Value="DNI" />
                        </Items>
                    </telerik:RadComboBox>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="lblNumeroDocumento" runat="server" Height="30px" Text="Número Documento " Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:TextBox ID="txtNumDoc" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Panel ID="panelLblContrasena" runat="server">
                        <asp:Label ID="lblContraseña" runat="server" Height="30px" Text="Contraseña" Width="100%"></asp:Label>
                    </asp:Panel>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Panel ID="panelTxtContrasena" runat="server">
                        <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </asp:Panel>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Panel ID="panelLblEstado" runat="server">
                        <asp:Label ID="lblEstado" runat="server" Height="30px" Text="Estado" Width="100%"></asp:Label>
                    </asp:Panel>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Panel ID="panelCboEstado" runat="server">
                        <telerik:RadComboBox ID="cboEstado" runat="server"
                            AppendDataBoundItems="true" Width="100%">
                            <Items>
                                <telerik:RadComboBoxItem Text="Seleccione..." Value="0" Selected="true" />
                                <telerik:RadComboBoxItem Text="Activo" Value="1" Selected="false" />
                                <telerik:RadComboBoxItem Text="Inactivo" Value="2" Selected="false" />
                            </Items>
                        </telerik:RadComboBox>
                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Button ID="btnAgregarUsuario" runat="server" Text="Guardar Usuario" CssClass="btn-block btn btn-primary" OnClick="btnAgregarUsuario_Click" />
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn-block btn btn-primary" OnClick="btnActualizar_Click" />
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn-block btn btn-danger" OnClick="btnCancelar_Click" />
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
