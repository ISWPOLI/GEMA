<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GraficaUsuarios.aspx.cs" Inherits="GraficaUsuarios" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <div class="container">
        <h3 class="text-center">GRAFICA POR USUARIO </h3>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-md-3">
            </div>
            <div class="col-md-3">
                <asp:Label ID="Label1" runat="server" Text="Nombre Usuario" CssClass="lbltexto" Height="30px" Width="140px"></asp:Label>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="cboGraficaNombreUsuario" runat="server" Width="100%" CssClass="form-control" >
                    <asp:ListItem Selected="True" Text="Todos los usuarios" Value="1" />
                    </asp:DropDownList>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-md-3">
            </div>
            <div class="col-md-3">
                <asp:Label ID="lblAño" runat="server" Text="Año" CssClass="lbltexto" Height="30px" Width="140px"></asp:Label>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddAño" runat="server" Width="100%" CssClass="form-control">
                    <asp:ListItem Selected="True" Text="2016" Value="2016" />
                    <asp:ListItem Text="2017" Value="2017" />
                    <asp:ListItem Text="2018" Value="2018" />
                    <asp:ListItem Text="2019" Value="2019" />
                    <asp:ListItem Text="2020" Value="2020" />
                    <asp:ListItem Text="2021" Value="2021" />
                    <asp:ListItem Text="2022" Value="2022" />
                    <asp:ListItem Text="2023" Value="2023" />
                    <asp:ListItem Text="2024" Value="2024" />
                    <asp:ListItem Text="2025" Value="2025" />
                    <asp:ListItem Text="2026" Value="2026" />
                    <asp:ListItem Text="2027" Value="2027" />
                    <asp:ListItem Text="2028" Value="2028" />
                    <asp:ListItem Text="2029" Value="2029" />
                    <asp:ListItem Text="2030" Value="2030" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-md-3">
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-3">
                <asp:Button ID="btoBuscar" runat="server" Text="Buscar" CssClass="btn btn-block btn-primary" />
            </div>
        </div>

        <div class="row" style="border: none !Important; padding-top: 20px">
            <telerik:RadChart ID="RadChart1" runat="server" Width="1200"
                AutoTextWrap="True"
                DataSourceID="SqlDataSourceRadChart" Skin="Terlerik"
                SeriesOrientation="Horizontal">
                <%--<Series>
                                <telerik:ChartSeries Name="enero" DataYColumn="enero" DataXColumn="enero">
                                    <appearance>
                                        <FillStyle MainColor="55, 167, 226" SecondColor="22, 85, 161">
                                            <FillSettings GradientMode="Vertical">
                                            </FillSettings>
                                        </FillStyle>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </appearance>
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="febrero"
                                    Name="febrero">
                                    <appearance>
                                        <FillStyle MainColor="223, 87, 60" SecondColor="200, 38, 37">
                                            <FillSettings GradientMode="Vertical">
                                            </FillSettings>
                                        </FillStyle>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </appearance>
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="marzo" Name="marzo">
                                    <appearance>
                                        <FillStyle MainColor="118, 203, 76" SecondColor="73, 166, 22">
                                            <FillSettings GradientMode="Vertical">
                                            </FillSettings>
                                        </FillStyle>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </appearance>
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="abril" Name="abril">
                                    <appearance>
                                        <FillStyle MainColor="119, 83, 76" SecondColor="88, 59, 52">
                                            <FillSettings GradientMode="Vertical">
                                            </FillSettings>
                                        </FillStyle>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </appearance>
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="mayo" Name="mayo">
                                    <appearance>
                                        <FillStyle MainColor="255, 222, 0" SecondColor="242, 188, 0">
                                            <FillSettings GradientMode="Vertical">
                                            </FillSettings>
                                        </FillStyle>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </appearance>
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="junio" Name="junio">
                                    <appearance>
                                        <FillStyle MainColor="164, 65, 221" SecondColor="125, 24, 167">
                                            <FillSettings GradientMode="Vertical">
                                            </FillSettings>
                                        </FillStyle>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </appearance>
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="julio" Name="julio">
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="agosto"
                                    Name="agosto">
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="septiembre"
                                    Name="septiembre">
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="octubre"
                                    Name="octubre">
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="noviembre"
                                    Name="noviembre">
                                </telerik:ChartSeries>
                                <telerik:ChartSeries DataYColumn="diciembre"
                                    Name="diciembre">
                                </telerik:ChartSeries>
                            </Series>--%>
                <PlotArea>
                    <XAxis DataLabelsColumn="NUsuario" AutoScale="False" MaxValue="1" MinValue="1"
                        Step="1">
                        <Appearance Color="134, 134, 134" MajorTick-Color="134, 134, 134">
                            <MajorGridLines Color="209, 222, 227" PenStyle="Solid" />
                            <TextAppearance TextProperties-Color="51, 51, 51">
                            </TextAppearance>
                        </Appearance>
                        <AxisLabel>
                            <Appearance RotationAngle="270">
                            </Appearance>
                            <TextBlock>
                                <Appearance TextProperties-Color="51, 51, 51">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                        <%--<Items>
                            <telerik:ChartAxisItem Value="1">
                                <textblock text="sebastian">
                                            </textblock>
                            </telerik:ChartAxisItem>
                        </Items>--%>
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
                            <Appearance RotationAngle="0">
                            </Appearance>
                            <TextBlock>
                                <Appearance TextProperties-Color="51, 51, 51">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                    </YAxis>
                    <YAxis2>
                        <AxisLabel>
                            <Appearance RotationAngle="0">
                            </Appearance>
                        </AxisLabel>
                    </YAxis2>
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
                    <TextBlock Text="Registro Actividades">
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
            <asp:SqlDataSource ID="SqlDataSourceRadChart" runat="server"
                ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
                SelectCommand="SELECT 'Administrador' NUsuario, 1500 AS enero,
                  1560  AS febrero,
                  1600  AS marzo,
                  1678  AS abril,
                  1890  AS mayo,
                  1200  AS junio,
                  1580  AS julio,
                  2020  AS agosto,
                  1350  AS septiembre,
                  1450  AS octubre,
                  1560  AS noviembre,
                  1200 AS diciembre FROM usuario  "></asp:SqlDataSource>
</asp:Content>
