<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GraficaPorTipoActividad.aspx.cs" Inherits="GraficaPorTipoActividad" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">    
    <div class="container">
        <h3 class="text-center">RESÚMEN DE HORAS POR TIPO DE ACTIVIDAD EN EL MES </h3>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-md-3">
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl" runat="server" Text="Resúmen del Mes" Width="100%"></asp:Label>
            </div>
            <div class="col-md-3">
                <telerik:RadComboBox ID="cboMes" runat="server" Width="100%">
                    <Items>
                        <telerik:RadComboBoxItem Text="Enero" Value="1" />
                        <telerik:RadComboBoxItem Text="Febrero" Value="2" />
                        <telerik:RadComboBoxItem Text="Marzo" Value="3" />
                        <telerik:RadComboBoxItem Text="Abril" Value="4" />
                        <telerik:RadComboBoxItem Text="Mayo" Value="5" />
                        <telerik:RadComboBoxItem Text="Junio" Value="6" />
                        <telerik:RadComboBoxItem Text="Julio" Value="7" />
                        <telerik:RadComboBoxItem Text="Agosto" Value="8" />
                        <telerik:RadComboBoxItem Text="Septiembre" Value="9" />
                        <telerik:RadComboBoxItem Text="Octubre" Value="10" />
                        <telerik:RadComboBoxItem Text="Noviembre" Value="11" />
                        <telerik:RadComboBoxItem Text="Diciembre" Value="12" />
                    </Items>
                </telerik:RadComboBox>
            </div>
        </div>
        <div class="container" style="padding-top:30px">
            <telerik:RadChart ID="RadChartActividadesPorUsuario" runat="server" AutoTextWrap="True" Width="1200"
                DataSourceID="DataSourceActividades">
                <PlotArea>
                    <XAxis DataLabelsColumn="NUsuario">
                        <Appearance Color="134, 134, 134" MajorTick-Color="134, 134, 134">
                            <MajorGridLines Color="209, 222, 227" PenStyle="Solid" />
                            <TextAppearance TextProperties-Color="51, 51, 51">
                            </TextAppearance>
                        </Appearance>
                        <AxisLabel>
                            <TextBlock>
                                <Appearance TextProperties-Color="51, 51, 51">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                    </XAxis>
                    <YAxis>
                        <Appearance Color="134, 134, 134" MajorTick-Color="134, 134, 134"
                            MinorTick-Color="134, 134, 134" MinorTick-Width="0">
                            <MajorGridLines Color="209, 222, 227" />
                            <MinorGridLines Color="233, 239, 241" />
                            <TextAppearance TextProperties-Color="51, 51, 51">
                            </TextAppearance>
                        </Appearance>
                        <AxisLabel>
                            <TextBlock>
                                <Appearance TextProperties-Color="51, 51, 51">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                    </YAxis>
                    <Appearance>
                        <FillStyle FillType="Solid" MainColor="White">
                        </FillStyle>
                        <Border Color="134, 134, 134" />
                    </Appearance>
                </PlotArea>
                <Appearance Corners="Round, Round, Round, Round, 6">
                    <FillStyle FillType="Image">
                        <FillSettings BackgroundImage="{chart}" ImageDrawMode="Flip" ImageFlip="FlipX">
                        </FillSettings>
                    </FillStyle>
                    <Border Color="138, 138, 138" />
                </Appearance>
                <ChartTitle>
                    <Appearance Position-AlignedPosition="Top">
                        <FillStyle MainColor="">
                        </FillStyle>
                    </Appearance>
                    <TextBlock Text="Resumen Actividades">
                        <Appearance TextProperties-Font="Tahoma, 13pt">
                        </Appearance>
                    </TextBlock>
                </ChartTitle>
                <Legend>
                    <Appearance Dimensions-Margins="0%, 3%, 1px, 1px"
                        Position-AlignedPosition="TopRight">
                        <ItemMarkerAppearance Figure="Square">
                            <Border Color="134, 134, 134" />
                        </ItemMarkerAppearance>
                        <FillStyle MainColor="">
                        </FillStyle>
                        <Border Color="Transparent" />
                    </Appearance>
                </Legend>
            </telerik:RadChart>
        </div>
    </div>
    <asp:SqlDataSource ID="DataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
        SelectCommand="SELECT 'desarrollo' nombreActividad, 300 / 60 AS horasXActividad FROM Usuario where idUsuario = 1 
                union all
                SELECT 'pruebas' nombreActividad, 100 / 60 AS horasXActividad FROM Usuario where idUsuario = 1 
                union all
                SELECT 'especificación' nombreActividad, 600 / 60 AS horasXActividad FROM Usuario where idUsuario = 1 
                union all
                SELECT 'diseño' nombreActividad, 400 / 60 AS horasXActividad FROM Usuario where idUsuario = 1 
                "></asp:SqlDataSource>
</asp:Content>
