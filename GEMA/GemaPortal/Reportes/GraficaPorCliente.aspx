<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GraficaPorCliente.aspx.cs" Inherits="GraficaPorCliente" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <div class="container">
        <h3 class="text-center">GRAFICA HORAS POR CLIENTE </h3>
        <div class="row text-right">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="Label1" runat="server" Text="Nombre Cliente" CssClass="lbltexto" Height="30px" Width="140px"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:DropDownList ID="cboGraficaNombreUsuario" runat="server" Width="100%" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="row text-right" style="padding-top:10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblFechaInicial" runat="server" Text="Fecha Inical" CssClass="lbltexto" Height="30px" Width="140px"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <telerik:RadDatePicker runat="server" ID="rdpFechaInicial" Culture="es-ES" Width="100%">
                    <DateInput ID="DateInput1" runat="server" AutoPostBack="false"
                        DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Height="25px">
                    </DateInput>
                </telerik:RadDatePicker>
            </div>
        </div>
        <div class="row text-right" style="padding-top:10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblFechaFinal" runat="server" Text="Fecha Final" CssClass="lbltexto" Height="30px" Width="140px"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <telerik:RadDatePicker runat="server" ID="rdpFechaFinal" Culture="es-ES" Width="100%">
                    <DateInput ID="DateInput2" runat="server" AutoPostBack="false"
                        DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Height="25px">
                    </DateInput>
                </telerik:RadDatePicker>
            </div>
        </div>
        <div class="row text-right" style="padding-top:10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Button ID="btoBuscar" runat="server" Text="Filtrar" CssClass="btn btn-block btn-primary"  />
            </div>
        </div>
        <div class="row" style="border: none !Important; width: 1200px !Important">            
            <telerik:RadHtmlChart runat="server" ID="PieChartGraficaPorCliente"
                Width="1200" Height="700" Transitions="true" Skin="Silk" DataSourceID="DataSourceGraficaPorCliente">
                <ChartTitle Text="">
                    <Appearance Align="Center" Position="Top">
                    </Appearance>
                </ChartTitle>
                <Legend>
                    <Appearance Position="Right" Visible="true">
                    </Appearance>
                </Legend>
                <PlotArea>
                    <Series>
                        <telerik:PieSeries StartAngle="90" DataFieldY="horas" NameField="Tema" ExplodeField="true">
                            <LabelsAppearance Position="Circle" DataFormatString="{0} Horas" DataField="horasCliente">
                            </LabelsAppearance>
                            <TooltipsAppearance Color="White" DataFormatString="{0} Horas"></TooltipsAppearance>
                        </telerik:PieSeries>
                    </Series>
                </PlotArea>
            </telerik:RadHtmlChart>
        </div>
        <asp:SqlDataSource ID="DataSourceGraficaPorCliente" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
            SelectCommand="Select top 1 razonsocial as Cliente, 4 idCliente_tema,'Desarrollo' Tema,300 as horas,'Desarrollo 300 Horas' as horasCliente from Cliente 
            union all
            Select top 1 razonsocial as Cliente, 4 idCliente_tema,'Prototipo' Tema,100 as horas,'Prototipo 100 Horas' as horasCliente from Cliente
            union all
            Select top 1 razonsocial as Cliente, 4 idCliente_tema,'Diseño' Tema,500 as horas,'Diseño 500 Horas' as horasCliente from Cliente
            union all
            Select top 1 razonsocial as Cliente, 4 idCliente_tema,'Pruebas' Tema,700 as horas,'Pruebas 700 Horas' as horasCliente from Cliente

            "></asp:SqlDataSource>
    </div>
</asp:Content>
