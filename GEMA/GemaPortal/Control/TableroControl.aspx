<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TableroControl.aspx.cs" Inherits="TableroControl" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div class="container" style="padding-top: 50px !Important">
        <h3 class="text-center">TABLERO CONTROL</h3>
        <div class="row">
            <div class="col-md-6">
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Width="540px" Height="480px">
                    <ChartTitle Text="Ultima ejecución JOB1">
                        <Appearance Align="Center" Position="Top">
                        </Appearance>
                    </ChartTitle>
                    <Legend>
                        <Appearance Position="Right" Visible="true">
                        </Appearance>
                    </Legend>
                    <PlotArea>
                        <Series>
                            <telerik:PieSeries StartAngle="90" DataFieldY="porcentaje" NameField="label" ExplodeField="true">
                                <LabelsAppearance Position="Circle" DataFormatString="{0}%" DataField="label">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="{0:0.00}%"></TooltipsAppearance>
                            </telerik:PieSeries>
                        </Series>
                    </PlotArea>
                </telerik:RadHtmlChart>
            </div>
            <div class="col-md-5">
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart3" Width="540px" Height="480px">
                    <ChartTitle Text="Ultima ejecución JOB2">
                        <Appearance Align="Center" Position="Top">
                        </Appearance>
                    </ChartTitle>
                    <Legend>
                        <Appearance Position="Right" Visible="true">
                        </Appearance>
                    </Legend>
                    <PlotArea>
                        <Series>
                            <telerik:PieSeries StartAngle="90" DataFieldY="porcentaje" NameField="label" ExplodeField="true">
                                <LabelsAppearance Position="Circle" DataFormatString="{0}%" DataField="label">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="{0:0.00}%"></TooltipsAppearance>
                            </telerik:PieSeries>
                        </Series>
                    </PlotArea>
                </telerik:RadHtmlChart>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Width="540px" Height="480px">
                    <PlotArea>
                        <Series>
                            <telerik:ScatterLineSeries DataFieldY="totalRegistros" DataFieldX="fecha">
                                <LabelsAppearance DataFormatString="{1}">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="{1} total registros leídos en <br/>{0:D}" />
                            </telerik:ScatterLineSeries>
                        </Series>
                        <XAxis Step="1" DataLabelsField="fecha">
                            <TitleAppearance Text="fecha ejecución">
                            </TitleAppearance>
                            <LabelsAppearance DataFormatString="d" RotationAngle="45">
                            </LabelsAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </XAxis>
                        <YAxis>
                            <TitleAppearance Text="Cantidad de registros">
                            </TitleAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </YAxis>
                    </PlotArea>
                    <ChartTitle Text="Reporte de ejecución ultimas 10 de cargas automáticas JOB1">
                    </ChartTitle>
                </telerik:RadHtmlChart>
            </div>
            <div class="col-md-5">
                <telerik:RadHtmlChart runat="server" ID="AreaChart" Width="540px" Height="480px">
                    <PlotArea>
                        <Series>
                            <telerik:ScatterLineSeries DataFieldY="totalRegistros" DataFieldX="fecha">
                                <LabelsAppearance DataFormatString="{1}">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="{1} total registros leídos en <br/>{0:D}" />
                            </telerik:ScatterLineSeries>
                        </Series>
                        <XAxis Step="1" DataLabelsField="fecha">
                            <TitleAppearance Text="fecha ejecución">
                            </TitleAppearance>
                            <LabelsAppearance DataFormatString="d" RotationAngle="45">
                            </LabelsAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </XAxis>
                        <YAxis>
                            <TitleAppearance Text="Cantidad de registros">
                            </TitleAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </YAxis>
                    </PlotArea>
                    <ChartTitle Text="Reporte de ejecución ultimas 10 cargas automáticas JOB2">
                    </ChartTitle>
                </telerik:RadHtmlChart>
            </div>
        </div>
        <div class="row">
            <h4 class="text-center">REPORTE EJECUCIONES HISTORICAS JOB 1</h4>
                <telerik:RadGrid ID="RadGridJOB1" GridLines="None" runat="server"
                    AllowSorting="True"
                    ShowStatusBar="true"
                    AllowPaging="True"
                    OnNeedDataSource="RadGridJOB1_NeedDataSource"
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
                    <MasterTableView CommandItemDisplay="None" DataKeyNames=""
                        EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                        NoMasterRecordsText="No hay registros para mostrar."
                        CommandItemSettings-RefreshText="Actualizar"
                        CommandItemSettings-ShowAddNewRecordButton="false"
                        CommandItemSettings-ShowRefreshButton="false">
                        <Columns>
                            <telerik:GridNumericColumn DataField="totalRegistros" HeaderText="Total Resgistros" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="totalRegistros" UniqueName="totalRegistros" AutoPostBackOnFilter="true" />
                            <telerik:GridNumericColumn DataField="regErroneos" HeaderText="Registros Erroneos" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="regErroneos" UniqueName="regErroneos" AutoPostBackOnFilter="true" />
                            <telerik:GridNumericColumn DataField="regCorrectos" HeaderText="Registros Correctos" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="regCorrectos" UniqueName="regCorrectos" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="tablaDestino" HeaderText="Tabla Destino" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="tablaDestino" UniqueName="tablaDestino" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="archivo" HeaderText="Archivo" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="archivo" UniqueName="archivo" AutoPostBackOnFilter="true" />
                            <telerik:GridDateTimeColumn DataField="CreadoFecha" HeaderText="fecha" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="CreadoFecha" FilterControlAltText="CreadoFecha" UniqueName="CreadoFecha" AutoPostBackOnFilter="true" EnableTimeIndependentFiltering="true" DataFormatString="{0:dd/MM/yyyy}" FilterDateFormat="dd/MM/yyyy" EditDataFormatString="dd/MM/yyyy" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
        </div>
        <div class="row">
            <h4 class="text-center">REPORTE EJECUCIONES HISTORICAS JOB 2</h4>
            <telerik:RadGrid ID="RadGridJOB2" GridLines="None" runat="server"
                    AllowSorting="True"
                    ShowStatusBar="true"
                    AllowPaging="True"
                    OnNeedDataSource="RadGridJOB2_NeedDataSource"
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
                    <MasterTableView CommandItemDisplay="None" DataKeyNames=""
                        EditMode="InPlace" HorizontalAlign="Center" Width="100%"
                        NoMasterRecordsText="No hay registros para mostrar."
                        CommandItemSettings-RefreshText="Actualizar"
                        CommandItemSettings-ShowAddNewRecordButton="false"
                        CommandItemSettings-ShowRefreshButton="false">
                        <Columns>
                            <telerik:GridNumericColumn DataField="totalRegistros" HeaderText="Total Resgistros" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" SortExpression="totalRegistros" UniqueName="totalRegistros" AutoPostBackOnFilter="true" />
                            <telerik:GridNumericColumn DataField="regErroneos" HeaderText="Registros Erroneos" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" SortExpression="regErroneos" UniqueName="regErroneos" AutoPostBackOnFilter="true" />
                            <telerik:GridNumericColumn DataField="regCorrectos" HeaderText="Registros Correctos" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" SortExpression="regCorrectos" UniqueName="regCorrectos" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="tablaDestino" HeaderText="Tabla Destino" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" SortExpression="tablaDestino" UniqueName="tablaDestino" AutoPostBackOnFilter="true" />
                            <telerik:GridBoundColumn DataField="archivo" HeaderText="Archivo" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" SortExpression="archivo" UniqueName="archivo" AutoPostBackOnFilter="true" />
                            <telerik:GridDateTimeColumn DataField="CreadoFecha" HeaderText="fecha" HeaderStyle-Width="100px" ItemStyle-Width="100px" FooterStyle-Width="100px" SortExpression="CreadoFecha" FilterControlAltText="CreadoFecha" UniqueName="CreadoFecha" AutoPostBackOnFilter="true" EnableTimeIndependentFiltering="true" DataFormatString="{0:dd/MM/yyyy}" FilterDateFormat="dd/MM/yyyy" EditDataFormatString="dd/MM/yyyy" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
        </div>
    </div>
    
</asp:Content>
