<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="Cliente" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
        <asp:Panel ID="panelListaProveedores" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    <asp:Button ID="btnNuevoProveedor" runat="server" Text="Agregar"
                        CssClass="btn btn-lg btn-primary btn-block" OnClick="btnNuevoProveedor_Click" />
                        </div>
                    <telerik:RadGrid ID="RadGridProveedores" GridLines="None" runat="server"
                    AllowAutomaticDeletes="false"
                    AllowSorting="True"
                    AllowAutomaticUpdates="false"
                    AllowAutomaticInserts="false"
                    OnItemDataBound="ItemDataBoundHandler"
                    ShowStatusBar="true"
                    OnItemCommand="RadGridProveedores_ItemCommand"
                    AllowPaging="True"
                    OnNeedDataSource="RadGridProveedores_NeedDataSource"
                    AllowFilteringByColumn="True"
                    OnDataBound="RadGridProveedores_DataBound"
                    CellSpacing="0"
                    Culture="es-ES"
                    AutoGenerateColumns="false">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>
                    <MasterTableView CommandItemDisplay="none" DataKeyNames="idCliente"
                        EditMode="EditForms" HorizontalAlign="Center"
                        NoMasterRecordsText="No hay registros para mostrar."
                        CommandItemSettings-RefreshText="Actualizar"
                        CommandItemSettings-AddNewRecordText="Agregar">
                        <Columns>
                            <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Modificar" HeaderText=""
                                Text="Editar" UniqueName="btnModificar" ItemStyle-Width="10px" ItemStyle-Height="10px">
                                <HeaderStyle Width="35px" />
                            </telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="idCliente" HeaderText="ID Cliente" ItemStyle-Font-Size="Small" HeaderStyle-Width="30px" ItemStyle-Width="30px" Visible="true" ReadOnly="false" SortExpression="idProveedor" Display="false" />
                            <telerik:GridBoundColumn DataField="razonSocial" HeaderText="Razón Social" ItemStyle-Font-Size="Small" HeaderStyle-Width="60px" ItemStyle-Width="60px" FilterControlAltText="Filter cliente column" SortExpression="nombreProveedor" UniqueName="nombreProveedor" />
                            <telerik:GridBoundColumn DataField="nit" HeaderText="NIT" ItemStyle-Font-Size="Small" HeaderStyle-Width="60px" ItemStyle-Width="60px" />
                            <telerik:GridBoundColumn DataField="idCiudad" HeaderText="ID Ciudad" ItemStyle-Font-Size="Small" HeaderStyle-Width="60px" ItemStyle-Width="60px" Display="false" />
                            <telerik:GridBoundColumn DataField="nombre" HeaderText="Ciudad" ItemStyle-Font-Size="Small" HeaderStyle-Width="60px" ItemStyle-Width="60px" />
                            <telerik:GridBoundColumn DataField="direccion" HeaderText="Dirección" ItemStyle-Font-Size="Small" HeaderStyle-Width="60px" ItemStyle-Width="60px" />
                            <telerik:GridBoundColumn DataField="telefonos" HeaderText="Teléfono" ItemStyle-Font-Size="Small" HeaderStyle-Width="60px" ItemStyle-Width="60px" />
                            <telerik:GridBoundColumn DataField="nombreContacto" HeaderText="Contacto" ItemStyle-Font-Size="Small" HeaderStyle-Width="60px" ItemStyle-Width="60px" />
                            <telerik:GridBoundColumn DataField="correo" HeaderText="Correo" FilterControlWidth="60px" ItemStyle-Font-Size="Small" HeaderStyle-Width="40px" ItemStyle-Width="40px" />
                            <telerik:GridBoundColumn DataField="estado" HeaderText="Estado" Display="false" ItemStyle-Font-Size="Small" HeaderStyle-Width="20px" ItemStyle-Width="20px" />
                        </Columns>
                        <EditFormSettings>
                            <FormTableItemStyle Wrap="False" />
                            <FormCaptionStyle CssClass="EditFormHeader" />
                            <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" GridLines="None" Width="100%" />
                            <FormTableStyle BackColor="White" CellPadding="2" CellSpacing="0" Height="110px" />
                            <FormTableAlternatingItemStyle Wrap="False" />
                            <EditColumn ButtonType="PushButton" CancelText="Cancelar edición" UniqueName="EditCommandColumn1">
                            </EditColumn>
                            <FormTableButtonRowStyle CssClass="botonGrilla" HorizontalAlign="Right" />
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelAgregarProveedor" runat="server" Visible="false">
            <div class="container">
            <div class="row">
                <div class="text-center">
                    INFORMACIÓN CLIENTE
                </div>
                <div class="center-block">
                    <div class="row form-group" style="width: 360px">
                        <div style="width: 120px; height: 360px; float:left !Important">
                            <asp:Label ID="lblNombreContacto" runat="server" CssClass="lbltexto" Height="50px"
                                Text="Nombre Contacto" Width="120px"></asp:Label>

                            <asp:Label ID="lblRazonSocial" runat="server" CssClass="lbltexto" Height="45px"
                                Text="Razon Social" Width="120px"></asp:Label>

                            <asp:Label ID="lblNit" runat="server" CssClass="lbltexto" Height="45px"
                                Text="NIT" Width="120px"></asp:Label>

                            <asp:Label ID="lblCiudad" runat="server" CssClass="lbltexto" Height="45px"
                                Text="Ciudad" Width="120px"></asp:Label>

                            <asp:Label ID="lblDireccion" runat="server" CssClass="lbltexto" Height="45px"
                                Text="Dirección" Width="120px"></asp:Label>

                            <asp:Label ID="lblTelefono" runat="server" CssClass="lbltexto" Height="45px"
                                Text="Teléfono" Width="120px"></asp:Label>

                            <asp:Label ID="lblCorreo" runat="server" CssClass="lbltexto" Height="45px"
                                Text="Correo Electrónico" Width="120px"></asp:Label>

                            <asp:Label ID="lblEstado" runat="server" CssClass="lbltexto" Height="45px"
                                Text="Estado" Width="120px"></asp:Label>

                        </div>
                        <div style="width: 220px; height: 360px; float: right">
                            <div style="width: 220px; height: 45px">
                                <asp:TextBox ID="txtNombreContacto" runat="server" Width="220px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="width: 220px; height: 45px">
                                <asp:TextBox ID="txtRazonSocial" runat="server" Width="220px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="width: 220px; height: 45px">
                                <asp:TextBox ID="txtNit" runat="server" Width="220px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="width: 220px; height: 45px">
                                <telerik:RadComboBox ID="cboCiudades" runat="server" DataTextField="nombre" DataValueField="idCiudad" AutoPostBack="true"
                                    Visible="true" AppendDataBoundItems="true" Skin="Sitefinity" Width="225px" DataSourceID="DataSourceCiudades">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Seleccione..." Value="0" Selected="true" />
                                    </Items>
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="DataSourceCiudades" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
                                    SelectCommand=" select idCiudad, nombre from Ciudad order by nombre asc "></asp:SqlDataSource>
                            </div>
                            <div style="width: 220px; height: 45px">
                                <asp:TextBox ID="txtDireccion" runat="server" Width="220px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="width: 220px; height: 45px">
                                <asp:TextBox ID="txtTelefono" runat="server" Width="220px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="width: 220px; height: 45px">
                                <asp:TextBox ID="txtCorreo" runat="server" Width="220px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="width: 220px; height: 45px">
                                <telerik:RadComboBox ID="cboEstado" runat="server" Visible="true" AppendDataBoundItems="true" Skin="Sitefinity"
                                    Width="225px">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Selccione..." Value="-1" Selected="true" />
                                        <telerik:RadComboBoxItem Text="Activo" Value="1" />
                                        <telerik:RadComboBoxItem Text="Inactivo" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="padding-left: 20px; padding-bottom: 10px">
                    <asp:Button ID="btnAgregarProveedor" runat="server" Text="Guardar"
                        CssClass="btn btn-lg btn-primary btn-block" OnClick="btnAgregarProveedor_Click" />

                    <asp:Button ID="btnActualizarProveedor" runat="server" Text="Actualizar"
                        CssClass="btn btn-lg btn-primary btn-block" OnClick="btnActualizarProveedor_Click" Visible="false" />

                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"
                        CssClass="btn btn-lg btn-primary btn-block" OnClick="btnCancelar_Click" />
                </div>
            </div>
                </div>
        </asp:Panel>
    </div>
</asp:Content>
