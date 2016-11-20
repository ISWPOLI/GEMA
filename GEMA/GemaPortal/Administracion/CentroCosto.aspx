<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CentroCosto.aspx.cs" Inherits="CentroCosto" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function DobleClickFila(sender, eventArgs) {
                var grid = $find("<%=RadGridCentroCosto.ClientID %>");
                var master = grid.get_masterTableView();
                editedRow = eventArgs.get_itemIndexHierarchical();
                master.fireCommand("DobleClickFilaEdicion", editedRow);
            }
        </script>
    </telerik:RadCodeBlock>
    <div class="container">
        <telerik:RadGrid ID="RadGridCentroCosto" GridLines="None" runat="server"
            AllowSorting="True"
            ShowStatusBar="true"
            AllowPaging="True"
            OnItemCommand="RadGridCentroCosto_ItemCommand"
            OnNeedDataSource="RadGridCentroCosto_NeedDataSource"
            OnInsertCommand="RadGridCentroCosto_InsertCommand"
            OnUpdateCommand="RadGridCentroCosto_UpdateCommand"
            AllowFilteringByColumn="True"
            CellSpacing="0"
            Culture="es-ES"
            AutoGenerateColumns="false">
            <PagerStyle Mode="NextPrevAndNumeric" />
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings>
                <Selecting AllowRowSelect="true" UseClientSelectColumnOnly="true"></Selecting>
                <ClientEvents OnRowDblClick="DobleClickFila" />
                <Scrolling AllowScroll="true" />
            </ClientSettings>
            <SelectedItemStyle BackColor="SkyBlue" BorderColor="Purple" BorderStyle="Dashed" BorderWidth="1px" />
            <MasterTableView CommandItemDisplay="Top" DataKeyNames="idCentroCosto"
                EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                NoMasterRecordsText="No hay registros para mostrar."
                CommandItemSettings-RefreshText="Actualizar"
                CommandItemSettings-ShowAddNewRecordButton="true"
                CommandItemSettings-ShowRefreshButton="false"
                CommandItemSettings-AddNewRecordText="Agregar" CommandItemStyle-CssClass="boton">
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="PushButton" UniqueName="editar" EditText="Editar" InsertText="Guardar" UpdateText="Guardar" CancelText="Cancelar" HeaderStyle-Width="20px" ItemStyle-Width="20px" FooterStyle-Width="20px" ItemStyle-Font-Size="Smaller" />
                    <telerik:GridBoundColumn DataField="codigoCentroCosto" HeaderText="Código" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="codigoCentroCosto" UniqueName="codigoCentroCosto" AutoPostBackOnFilter="true" />
                    <telerik:GridBoundColumn DataField="nombre" HeaderText="Nombre" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="nombre" UniqueName="nombre" AutoPostBackOnFilter="true" />
                    <telerik:GridTemplateColumn HeaderText="Cliente" DataField="razonSocial" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "razonSocial")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="cboCliente" runat="server" DataSourceID="DataSourceCliente" Filter="Contains" DropDownAutoWidth="Enabled"
                                DataTextField="razonSocial" DataValueField="idCliente" SelectedValue='<%#Bind("idCliente")%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemStyle Width="240px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridDateTimeColumn DataField="fechaInicio" HeaderText="Fecha Inicio" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="fechaInicio" FilterControlAltText="fechaInicio" UniqueName="fechaInicio" AutoPostBackOnFilter="true" EnableTimeIndependentFiltering="true" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}" EditDataFormatString="dd/MM/yyyy" FilterDateFormat="dd/MM/yyyy" />
                    <telerik:GridNumericColumn DataField="valorTotalEstimado" HeaderText="Valor Total Estimado" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="valorTotalEstimado" UniqueName="valorTotalEstimado" AutoPostBackOnFilter="true" />
                    <telerik:GridNumericColumn DataField="valorCostoEstimado" HeaderText="Valor Costo Estimado" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="valorCostoEstimado" UniqueName="valorCostoEstimado" AutoPostBackOnFilter="true" />                    
                    <telerik:GridTemplateColumn HeaderText="Clase" DataField="claseCC" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "claseCC")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="cboClase" runat="server" DataSourceID="DataSourceClase" Filter="Contains" DropDownAutoWidth="Enabled"
                                DataTextField="valor" DataValueField="idDominio" SelectedValue='<%#Bind("idDominioC")%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemStyle Width="240px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Vendedor" DataField="vendedorCC" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "vendedorCC")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="cboVendedor" runat="server" DataSourceID="DataSourceVendedor" Filter="Contains" DropDownAutoWidth="Enabled"
                                DataTextField="valor" DataValueField="idDominio" SelectedValue='<%#Bind("idVendedor")%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemStyle Width="240px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridNumericColumn DataField="porcentajeComision" HeaderText="% Comisión" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="valorTRM" UniqueName="valorTRM" AutoPostBackOnFilter="true" />
                    <telerik:GridCheckBoxColumn DataField="estado" HeaderText="Estado" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="estado" FilterControlAltText="estado" UniqueName="estado" AutoPostBackOnFilter="true" />
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
        <asp:SqlDataSource ID="DataSourceCliente" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                                SelectCommand="select idCliente, razonSocial from Cliente order by razonSocial asc" />
        <asp:SqlDataSource ID="DataSourceClase" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                                SelectCommand="select idDominio, valor from Dominio where activa = 1 and idTipoDominio = 1 order by valor asc" />
        <asp:SqlDataSource ID="DataSourceVendedor" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                                SelectCommand="select idDominio, valor from Dominio where activa = 1 and idTipoDominio = 1 order by valor asc" />
    </div>
</asp:Content>
