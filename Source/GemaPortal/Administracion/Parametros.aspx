<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Parametros.aspx.cs" Inherits="Parametros" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <script src="../Scripts/jquery-1.12.3.min.js"></script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function DobleClickFila(sender, eventArgs) {
                var grid = $find("<%=RadGridTipoDominio.ClientID %>");
                    var master = grid.get_masterTableView();
                    editedRow = eventArgs.get_itemIndexHierarchical();
                    master.fireCommand("DobleClickFilaEdicion", editedRow);
                }
                function DobleClickFila(sender, eventArgs) {
                    var grid = $find("<%=RadGridDominio.ClientID %>");
                    var master = grid.get_masterTableView();
                    editedRow = eventArgs.get_itemIndexHierarchical();
                    master.fireCommand("DobleClickFilaEdicion", editedRow);
                }
                function DobleClickFila(sender, eventArgs) {
                    var grid = $find("<%=RadGridSubDominio.ClientID %>");
                    var master = grid.get_masterTableView();
                    editedRow = eventArgs.get_itemIndexHierarchical();
                    master.fireCommand("DobleClickFilaEdicion", editedRow);
                }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadTabStrip ID="RadTabStripParamteros" runat="server" MultiPageID="RadMultiPage1" Width="100%" Align="Center"
        SelectedIndex="0" OnTabClick="RadTabStrip1_TabClick">
        <Tabs>
            <telerik:RadTab Text="Tipo dominio" runat="server" Selected="True" />
            <telerik:RadTab Text="Dominio" runat="server" />
            <telerik:RadTab Text="SubDominio" runat="server" />
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
        <telerik:RadPageView runat="server" ID="RadPageViewTipoDominio">
            <div class="container">
                <asp:Panel ID="panelListaUsuarios" runat="server">
                    <div class="CentrarDivContenedor">
                        <telerik:RadGrid ID="RadGridTipoDominio" GridLines="None" runat="server"
                            AllowSorting="True"
                            ShowStatusBar="true"
                            AllowPaging="True"
                            OnItemCommand="RadGridTipoDominio_ItemCommand"
                            OnNeedDataSource="RadGridTipoDominio_NeedDataSource"
                            OnInsertCommand="RadGridTipoDominio_InsertCommand"
                            OnUpdateCommand="RadGridTipoDominio_UpdateCommand"
                            AllowFilteringByColumn="True"
                            CellSpacing="0"
                            Culture="es-ES"
                            AutoGenerateColumns="false">
                            <PagerStyle Mode="NextPrevAndNumeric" />
                            <GroupingSettings CaseSensitive="false" />
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" UseClientSelectColumnOnly="true"></Selecting>
                                <ClientEvents OnRowDblClick="DobleClickFila" />
                            </ClientSettings>
                            <SelectedItemStyle BackColor="SkyBlue" BorderColor="Purple" BorderStyle="Dashed" BorderWidth="1px" />
                            <MasterTableView CommandItemDisplay="Top" DataKeyNames="idTipoDominio"
                                EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                                NoMasterRecordsText="No hay registros para mostrar."
                                CommandItemSettings-RefreshText="Actualizar"
                                CommandItemSettings-ShowAddNewRecordButton="true"
                                CommandItemSettings-ShowRefreshButton="false"
                                CommandItemSettings-AddNewRecordText="Agregar" CommandItemStyle-CssClass="boton">
                                <Columns>
                                    <telerik:GridEditCommandColumn ButtonType="PushButton" UniqueName="editar" EditText="Editar" InsertText="Guardar" UpdateText="Guardar" CancelText="Cancelar" HeaderStyle-Width="20px" ItemStyle-Width="20px" FooterStyle-Width="20px" ItemStyle-Font-Size="Smaller" />
                                    <telerik:GridBoundColumn DataField="tipoDominio" HeaderText="Tipo Dominio" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="tipoDominio" UniqueName="tipoDominio" AutoPostBackOnFilter="true" />
                                    <telerik:GridBoundColumn DataField="descripcion" HeaderText="Descripción" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="descripcion" FilterControlAltText="descripcion" UniqueName="descripcion" AutoPostBackOnFilter="true" />
                                    <telerik:GridCheckBoxColumn DataField="activa" HeaderText="Estado" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="activa" FilterControlAltText="activa" UniqueName="activa" AutoPostBackOnFilter="true" />
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
                        </telerik:RadGrid>
                    </div>
                </asp:Panel>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageViewDominio">
            <div class="container">
                <asp:Panel ID="panel1" runat="server">
                    <div class="CentrarDivContenedor">
                        <telerik:RadGrid ID="RadGridDominio" GridLines="None" runat="server"
                            AllowSorting="True"
                            ShowStatusBar="true"
                            AllowPaging="True"
                            OnItemCommand="RadGridDominio_ItemCommand"
                            OnNeedDataSource="RadGridDominio_NeedDataSource"
                            OnInsertCommand="RadGridDominio_InsertCommand"
                            OnUpdateCommand="RadGridDominio_UpdateCommand"
                            AllowFilteringByColumn="True"
                            CellSpacing="0"
                            Culture="es-ES"
                            AutoGenerateColumns="false">
                            <PagerStyle Mode="NextPrevAndNumeric" />
                            <GroupingSettings CaseSensitive="false" />
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" UseClientSelectColumnOnly="true"></Selecting>
                                <ClientEvents OnRowDblClick="DobleClickFila" />
                            </ClientSettings>
                            <SelectedItemStyle BackColor="SkyBlue" BorderColor="Purple" BorderStyle="Dashed" BorderWidth="1px" />
                            <MasterTableView CommandItemDisplay="Top" DataKeyNames="idDominio"
                                EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                                NoMasterRecordsText="No hay registros para mostrar."
                                CommandItemSettings-RefreshText="Actualizar"
                                CommandItemSettings-ShowAddNewRecordButton="true"
                                CommandItemSettings-ShowRefreshButton="false"
                                CommandItemSettings-AddNewRecordText="Agregar" CommandItemStyle-CssClass="boton">
                                <Columns>
                                    <telerik:GridEditCommandColumn ButtonType="PushButton" UniqueName="editar" EditText="Editar" InsertText="Guardar" UpdateText="Guardar" CancelText="Cancelar" HeaderStyle-Width="20px" ItemStyle-Width="20px" FooterStyle-Width="20px" ItemStyle-Font-Size="Smaller" />
                                    <telerik:GridTemplateColumn HeaderText="Tipo Dominio" DataField="tipoDominio" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                                        <ItemTemplate>
                                            <%#DataBinder.Eval(Container.DataItem, "tipoDominio")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="cboTipoDominio" runat="server" DataSourceID="DataSourceTipoDominio" Filter="Contains" DropDownAutoWidth="Enabled"
                                                DataTextField="tipoDominio" DataValueField="idTipoDominio" SelectedValue='<%#Bind("idTipoDominio")%>'>
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="240px" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="codigo" HeaderText="Código" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="codigo" FilterControlAltText="codigo" UniqueName="codigo" AutoPostBackOnFilter="true" />
                                    <telerik:GridBoundColumn DataField="valor" HeaderText="Valor" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="valor" FilterControlAltText="valor" UniqueName="valor" AutoPostBackOnFilter="true" />
                                    <telerik:GridCheckBoxColumn DataField="activa" HeaderText="Estado" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="activa" FilterControlAltText="activa" UniqueName="activa" AutoPostBackOnFilter="true" />
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
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="DataSourceTipoDominio" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                            SelectCommand="SELECT [idTipoDominio],[tipoDominio] FROM [dbo].[TipoDominio] ORDER BY [tipoDominio] ASC" />
                    </div>
                </asp:Panel>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageViewSubDominio">
            <div class="container">
                <asp:Panel ID="panel2" runat="server" Visible="true">
                    <div class="CentrarDivContenedor">
                        <telerik:RadGrid ID="RadGridSubDominio" GridLines="None" runat="server"
                            AllowSorting="True"
                            ShowStatusBar="true"
                            AllowPaging="True"
                            OnItemCommand="RadGridSubDominio_ItemCommand"
                            OnNeedDataSource="RadGridSubDominio_NeedDataSource"
                            OnInsertCommand="RadGridSubDominio_InsertCommand"
                            OnUpdateCommand="RadGridSubDominio_UpdateCommand"
                            AllowFilteringByColumn="True"
                            CellSpacing="0"
                            Culture="es-ES"
                            AutoGenerateColumns="false">
                            <PagerStyle Mode="NextPrevAndNumeric" />
                            <GroupingSettings CaseSensitive="false" />
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" UseClientSelectColumnOnly="true"></Selecting>
                                <ClientEvents OnRowDblClick="DobleClickFila" />
                            </ClientSettings>
                            <SelectedItemStyle BackColor="SkyBlue" BorderColor="Purple" BorderStyle="Dashed" BorderWidth="1px" />
                            <MasterTableView CommandItemDisplay="Top" DataKeyNames="idSubDominio"
                                EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                                NoMasterRecordsText="No hay registros para mostrar."
                                CommandItemSettings-RefreshText="Actualizar"
                                CommandItemSettings-ShowAddNewRecordButton="true"
                                CommandItemSettings-ShowRefreshButton="false"
                                CommandItemSettings-AddNewRecordText="Agregar" CommandItemStyle-CssClass="boton">
                                <Columns>
                                    <telerik:GridEditCommandColumn ButtonType="PushButton" UniqueName="editar" EditText="Editar" InsertText="Guardar" UpdateText="Guardar" CancelText="Cancelar" HeaderStyle-Width="20px" ItemStyle-Width="20px" FooterStyle-Width="20px" ItemStyle-Font-Size="Smaller" />
                                    <telerik:GridTemplateColumn HeaderText="Dominio" DataField="valor" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                                        <ItemTemplate>
                                            <%#DataBinder.Eval(Container.DataItem, "valor")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="cboDominio" runat="server" DataSourceID="DataSourceDominio" Filter="Contains" DropDownAutoWidth="Enabled"
                                                DataTextField="valor" DataValueField="idDominio" SelectedValue='<%#Bind("idDominio")%>'>
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="240px" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="codigo" HeaderText="Código" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="codigo" FilterControlAltText="codigo" UniqueName="codigo" AutoPostBackOnFilter="true" />
                                    <telerik:GridBoundColumn DataField="valor" HeaderText="Valor" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="valor" FilterControlAltText="valor" UniqueName="valor" AutoPostBackOnFilter="true" />
                                    <telerik:GridCheckBoxColumn DataField="activa" HeaderText="Estado" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="activa" FilterControlAltText="activa" UniqueName="activa" AutoPostBackOnFilter="true" />
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
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="DataSourceDominio" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                            SelectCommand="select idDominio, valor from Dominio where activa = 1 order by valor asc" />
                    </div>
                </asp:Panel>
            </div>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
