<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="NuevoProyecto.aspx.cs" Inherits="BigDataAnalitycs.Proyecto.NuevoProyecto" %>

<asp:Content runat="server" ID="AnalisisNuevoProyecto" ContentPlaceHolderID="MainContent">    
    <script src="../js/bootstrap.min.js"></script>
    <div class="container-fluid">
        <h3 class="text-center">ANÁLSIS NUEVO PROYECTO </h3>
        <div class="row">
            <div class="col-md-2 form-group text-right">
                <label for="lblCliente">Cliente</label>
            </div>
            <div class="col-md-4 form-group">
                <telerik:RadComboBox ID="cboCliente" runat="server" Filter="Contains" DropDownAutoWidth="Enabled" 
                    EnableLoadOnDemand="true" EmptyMessage="Seleccione el cliente" OnItemsRequested="cboCliente_ItemsRequested"
                    LoadingMessage="Cargando Clientes" Width="100%" OnSelectedIndexChanged="cboCliente_SelectedIndexChanged" 
                    AutoPostBack="true"/>
            </div>
            <div class="col-md-6 form-group">
                <telerik:RadHtmlChart runat="server" ID="chartCliente" Width="640px" Height="480px">
                    <PlotArea>
                        <Series>
                            <telerik:ScatterLineSeries DataFieldY="valorEstimado" DataFieldX="creadoFecha">
                                <LabelsAppearance DataFormatString="{1}">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="${1} Estimado <br/>{0:D}" />
                            </telerik:ScatterLineSeries>
                            <telerik:ScatterLineSeries DataFieldY="valorPresupuesto" DataFieldX="creadoFecha">
                                <LabelsAppearance DataFormatString="{1}">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="${1} Presupuesto <br/>{0:D}" />
                            </telerik:ScatterLineSeries>
                            <telerik:ScatterLineSeries DataFieldY="valorRealEjecutado" DataFieldX="creadoFecha">
                                <LabelsAppearance DataFormatString="{1}">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="${1} Ejecutado <br/>{0:D}" />
                            </telerik:ScatterLineSeries>
                        </Series>
                        <XAxis Step="1" DataLabelsField="fecha">
                            <TitleAppearance Text="Ultimos proyectos">
                            </TitleAppearance>
                            <LabelsAppearance DataFormatString="d">
                            </LabelsAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </XAxis>
                        <YAxis>
                            <TitleAppearance Text="Valor">
                            </TitleAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </YAxis>
                    </PlotArea>
                    <ChartTitle Text="Ultimos 4 proyectos del cliente">
                    </ChartTitle>
                </telerik:RadHtmlChart>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 form-group text-right">
                <label for="lblCliente">Duración promedio contrato</label>
            </div>
            <div class="col-md-4 form-group">
                <asp:TextBox ID="txtDuracionPromedio" runat="server" class="form-control" />
            </div>
            <div class="col-md-6 form-group">
            </div>
        </div>
        <%--<div class="row">
            <div class="col-md-2 form-group text-right">
                <label for="lblCliente">Tipo proyecto</label>
            </div>
            <div class="col-md-4 form-group">
                <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" />
            </div>
            <div class="col-md-6 form-group">
            </div>
        </div>--%>
        <div class="row">
            <div class="col-md-2 form-group text-right">
                <%--<label for="lblArticulo" style="width:100%;padding-top:10px !Important">Artículo</label>
                <label for="lblMarca" style="width:100%">Marca</label>
                <label for="lblPrecioCompraExt" style="width:100%">Precio Compra Exterior</label>--%>
                <label for="lblTRM" style="width:100%">TRM</label>
            </div>
            <div class="col-md-4 form-group">
                <%--<asp:DropDownList ID="ddlArticulo" runat="server" class="form-control" />
                <asp:DropDownList ID="ddlMarca" runat="server" class="form-control" />
                <asp:TextBox ID="txtPrecioCompraExt" runat="server" class="form-control" />--%>
                <asp:TextBox ID="txtTRM" runat="server" class="form-control" />
            </div>
            <div class="col-md-6 form-group">
                <telerik:RadHtmlChart runat="server" ID="AreaChart">
                    <PlotArea>
                        <Series>
                            <telerik:ScatterLineSeries DataFieldY="valorTRM" DataFieldX="fecha">
                                <LabelsAppearance DataFormatString="{1}">
                                </LabelsAppearance>
                                <TooltipsAppearance Color="White" DataFormatString="${1} valor del dolar en<br/>{0:D}" />
                            </telerik:ScatterLineSeries>
                        </Series>
                        <XAxis Step="1" DataLabelsField="fecha">
                            <TitleAppearance Text="Ultimos días">
                            </TitleAppearance>
                            <LabelsAppearance DataFormatString="d">
                            </LabelsAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </XAxis>
                        <YAxis>
                            <TitleAppearance Text="Valor">
                            </TitleAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </YAxis>
                    </PlotArea>
                    <ChartTitle Text="Comportamiento del dólar">
                    </ChartTitle>
                </telerik:RadHtmlChart>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 form-group text-right">
                <label for="lblCompetencia" style="width:100%;padding-top:10px !Important">Valor Competencia</label>
                <%--<label for="lblVendedor" style="width:100%">Vendedor</label>
                <label for="lblComision" style="width:100%">Comisión</label>--%>
                <label for="lblValorPresup" style="width:100%">Valor presupuestado</label>
            </div>
            <div class="col-md-4 form-group">
                <asp:TextBox ID="txtCompetencia" runat="server" class="form-control" />
                <%--<asp:TextBox ID="txtVendedor" runat="server" class="form-control" />
                <asp:TextBox ID="txtComision" runat="server" class="form-control" />--%>
                <asp:TextBox ID="txtValorPresup" runat="server" class="form-control" />
            </div>
            <div class="col-md-6 form-group">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="btnAnalizar" runat="server" Text="Analizar"
                    CssClass="btn btn-lg btn-primary btn-block" OnClick="btnAnalizar_Click" />
            </div>
        </div>
        <asp:Panel ID="panelresultado" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-6 form-group">
                    <telerik:RadHtmlChart runat="server" ID="RadHtmlChartResultado">
                        <PlotArea>
                            <Series>
                                <telerik:ColumnSeries DataFieldY="promedioEstimado" Name="Valor Estimado">
                                    <LabelsAppearance DataFormatString="{1}">
                                    </LabelsAppearance>
                                    <TooltipsAppearance Color="White" DataFormatString="${1} valor Estimado <br/>{0:D}" />
                                </telerik:ColumnSeries>
                                <telerik:BarSeries DataFieldY="promedioEjecutado" Name="Valor Ejecutado/Presupuestado">
                                    <LabelsAppearance DataFormatString="{1}">
                                    </LabelsAppearance>
                                    <TooltipsAppearance Color="White" DataFormatString="${1} valor Ejecutado/Presupuestado<br/>{0:D}" />
                                </telerik:BarSeries>
                            </Series>
                            <XAxis DataLabelsField="fecha">
                            </XAxis>
                        </PlotArea>
                        <ChartTitle Text="Resultado del análisis">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                </div>
                <div class="col-md-5">
                    <asp:TextBox ID="txtResultado" runat="server" class="form-control" TextMode="MultiLine" Height="260px" />
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
