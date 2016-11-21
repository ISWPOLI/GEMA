<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TableroControl.aspx.cs" Inherits="TableroControl" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div class="container" style="padding-top: 50px !Important">
        <h3 class="text-center">TABLERO CONTROL</h3>
        <div class="row">
            <div class="col-md-6">
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Width="540px" Height="480px">
                    <ChartTitle Text="Porcentaje inversión del tiempo">
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
                    <ChartTitle Text="Porcentaje actividades">
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
                                <TooltipsAppearance Color="White" DataFormatString="{1} total horas invertidas <br/>{0:D}" />
                            </telerik:ScatterLineSeries>
                        </Series>
                        <XAxis Step="1" DataLabelsField="fecha">
                            <TitleAppearance Text="fecha actividad">
                            </TitleAppearance>
                            <LabelsAppearance DataFormatString="d" RotationAngle="45">
                            </LabelsAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </XAxis>
                        <YAxis>
                            <TitleAppearance Text="horas tipo actividad">
                            </TitleAppearance>
                            <MajorGridLines Color="#EFEFEF" Width="1"></MajorGridLines>
                            <MinorGridLines Color="#F7F7F7" Width="1"></MinorGridLines>
                        </YAxis>
                    </PlotArea>
                    <ChartTitle Text="Reporte horas por tipo actividad">
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
                    <ChartTitle Text="Reporte de actividades ultimo mes">
                    </ChartTitle>
                </telerik:RadHtmlChart>
            </div>
        </div>        
    </div>
</asp:Content>
