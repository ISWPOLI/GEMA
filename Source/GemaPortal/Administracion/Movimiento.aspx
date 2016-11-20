<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movimiento.aspx.cs" Inherits="Movimiento" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function DobleClickFila(sender, eventArgs) {
                var grid = $find("<%=RadGridMovimiento.ClientID %>");
                var master = grid.get_masterTableView();
                editedRow = eventArgs.get_itemIndexHierarchical();
                master.fireCommand("DobleClickFilaEdicion", editedRow);
            }
        </script>
    </telerik:RadCodeBlock>
    <div class="container">
        <telerik:RadGrid ID="RadGridMovimiento" GridLines="None" runat="server"
            AllowSorting="True"
            ShowStatusBar="true"
            AllowPaging="True"
            OnItemCommand="RadGridMovimiento_ItemCommand"
            OnNeedDataSource="RadGridMovimiento_NeedDataSource"
            OnInsertCommand="RadGridMovimiento_InsertCommand"
            OnUpdateCommand="RadGridMovimiento_UpdateCommand"
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
            <MasterTableView CommandItemDisplay="Top" DataKeyNames="idMovimiento"
                EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                NoMasterRecordsText="No hay registros para mostrar."
                CommandItemSettings-RefreshText="Actualizar"
                CommandItemSettings-ShowAddNewRecordButton="true"
                CommandItemSettings-ShowRefreshButton="false"
                CommandItemSettings-AddNewRecordText="Agregar" CommandItemStyle-CssClass="boton">
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="PushButton" UniqueName="editar" EditText="Editar" InsertText="Guardar" UpdateText="Guardar" CancelText="Cancelar" HeaderStyle-Width="20px" ItemStyle-Width="20px" FooterStyle-Width="20px" ItemStyle-Font-Size="Smaller" />
                    <telerik:GridBoundColumn DataField="consecutivo" HeaderText="Código" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="consecutivo" UniqueName="consecutivo" AutoPostBackOnFilter="true" />                    
                    <telerik:GridTemplateColumn HeaderText="Centro Costo" DataField="centroCosto" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "centroCosto")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="cboCentroCosto" runat="server" DataSourceID="DataSourceCentroCosto" Filter="Contains" DropDownAutoWidth="Enabled"
                                DataTextField="nombre" DataValueField="idCentroCosto" SelectedValue='<%#Bind("idCentroCosto")%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemStyle Width="240px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Concepto Gasto" DataField="conceptoGasto" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "conceptoGasto")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="cboConceptoGasto" runat="server" DataSourceID="DataSourceConceptoGasto" Filter="Contains" DropDownAutoWidth="Enabled"
                                DataTextField="valor" DataValueField="idDominio" SelectedValue='<%#Bind("idConceptoGasto")%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemStyle Width="240px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Tipo" DataField="tipo" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "tipo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="cboTipo" runat="server" DataSourceID="DataSourceTipo" Filter="Contains" DropDownAutoWidth="Enabled"
                                DataTextField="valor" DataValueField="idDominio" SelectedValue='<%#Bind("idTipo")%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemStyle Width="240px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridDateTimeColumn DataField="fechaMovimiento" HeaderText="Fecha Movimiento" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="fechaMovimiento" FilterControlAltText="fechaMovimiento" UniqueName="fechaMovimiento" AutoPostBackOnFilter="true" EnableTimeIndependentFiltering="true" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}" EditDataFormatString="dd/MM/yyyy" FilterDateFormat="dd/MM/yyyy" />
                    <telerik:GridBoundColumn DataField="detalle" HeaderText="Detalle" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="detalle" UniqueName="detalle" AutoPostBackOnFilter="true" />
                    <telerik:GridTemplateColumn HeaderText="Tercero" DataField="tercero" AutoPostBackOnFilter="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px" FilterControlWidth="100px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "tercero")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="cboTercero" runat="server" DataSourceID="DataSourceTercero" Filter="Contains" DropDownAutoWidth="Enabled"
                                DataTextField="valor" DataValueField="idDominio" SelectedValue='<%#Bind("idtercero")%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemStyle Width="240px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridNumericColumn DataField="valor" HeaderText="Valor hora" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="valor" UniqueName="valor" AutoPostBackOnFilter="true" />
                    <telerik:GridNumericColumn DataField="totalHoras" HeaderText="Total Horas" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="totalHoras" UniqueName="totalHoras" AutoPostBackOnFilter="true" />
                    <telerik:GridNumericColumn DataField="total" HeaderText="Valor Total" HeaderStyle-Width="250px" ItemStyle-Width="250px" SortExpression="total" UniqueName="total" AutoPostBackOnFilter="true" ReadOnly="true" />                    
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
        <asp:SqlDataSource ID="DataSourceCentroCosto" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                                SelectCommand="select idCentroCosto, nombre from CentroCosto where estado = 1" />
        <asp:SqlDataSource ID="DataSourceConceptoGasto" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                                SelectCommand="select idDominio, valor from Dominio where activa = 1 and idTipoDominio = 1 order by valor asc" />
        <asp:SqlDataSource ID="DataSourceTipo" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                                SelectCommand="select idDominio, valor from Dominio where activa = 1 and idTipoDominio = 1 order by valor asc" />
        <asp:SqlDataSource ID="DataSourceTercero" runat="server" ConnectionString="<%$ ConnectionStrings: DataSourceBaseDatos %>"
                                SelectCommand="select idDominio, valor from Dominio where activa = 1 and idTipoDominio = 1 order by valor asc" />
    </div>
</asp:Content>
