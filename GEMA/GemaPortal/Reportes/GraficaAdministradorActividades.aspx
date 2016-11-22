<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GraficaAdministradorActividades.aspx.cs" Inherits="GraficaAdministradorActividades" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">
    <div class="container">
        <div class="CentrarDivContenedor" style="width: 1000px !Important">
            <h3 class="text-center">ADMINISTRADOR DE ACTIVIDADES </h3>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="Label1" runat="server" Text="Nombre Usuario" CssClass="lbltexto" Height="30px" Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:DropDownList ID="cboGraficaNombreUsuario" runat="server" AutoPostBack="false" Width="100%" CssClass="form-control" />
                </div>
            </div>
            <div class="row text-right" style="padding-top:10px">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Label ID="Label2" runat="server" Text="Fecha Inicio" CssClass="lbltexto" Height="30px" Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <telerik:RadDatePicker ID="radFechaInicio" runat="server" AutoPostBack="false"
                        CssClass="texto_obligatorio" Height="20px" MaxDate="01/01/3000"
                        MinDate="01/01/1000" Style="margin-left: 0px" Width="100%">
                        <Calendar ID="Calendar2" runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay ItemStyle-CssClass="rcToday" Repeatable="Today">
                                    <ItemStyle CssClass="rcToday" />
                                </telerik:RadCalendarDay>
                            </SpecialDays>
                        </Calendar>
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
                    <asp:Label ID="Label3" runat="server" Text="Fecha Final" Height="30px" Width="100%"></asp:Label>
                </div>
                <div class="col-sm-6 col-md-3">
                    <telerik:RadDatePicker ID="radFechaFinal" runat="server" AutoPostBack="true"
                        CssClass="texto_obligatorio" Height="20px" MaxDate="01/01/3000"
                        MinDate="01/01/1000" Style="margin-left: 0px" Width="100%">
                        <Calendar ID="Calendar1" runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay ItemStyle-CssClass="rcToday" Repeatable="Today">
                                    <ItemStyle CssClass="rcToday" />
                                </telerik:RadCalendarDay>
                            </SpecialDays>
                        </Calendar>
                        <DateInput ID="DateInput2" runat="server" AutoPostBack="True"
                            DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Height="25px">
                        </DateInput>
                    </telerik:RadDatePicker>
                </div>
            </div>
            <div class="row text-right">
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                </div>
                <div class="col-sm-6 col-md-3">
                    <asp:Button ID="btoBuscar" runat="server" Text="Buscar" Width="100%" CssClass="btn btn-block btn-primary" />
                </div>
            </div>
            <div class="row">
                <div class="CentrarDivContenedor" style="border: none !Important; padding-top: 20px">
                    <telerik:RadChart ID="RadChart1" runat="server" Width="1200px"
                        AutoTextWrap="True" DataSourceID="SqlDataSourceRadChart" Skin="Telerik">
                        <%--<Series>
                                <telerik:ChartSeries Name="horas" DataYColumn="horas" DataLabelsColumn="Tema">
                                    <Appearance>
                                        <FillStyle FillType="ComplexGradient">
                                            <FillSettings>
                                                <ComplexGradient>
                                                    <telerik:GradientElement Color="213, 247, 255" />
                                                    <telerik:GradientElement Color="193, 239, 252" Position="0.5" />
                                                    <telerik:GradientElement Color="157, 217, 238" Position="1" />
                                                </ComplexGradient>
                                            </FillSettings>
                                        </FillStyle>
                                        <TextAppearance TextProperties-Color="51, 51, 51">
                                        </TextAppearance>
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>--%>
                        <PlotArea>
                            <XAxis DataLabelsColumn="Tema" AutoScale="false" MaxValue="7" MinValue="1" Step="1">
                                <%--<Appearance Color="182, 182, 182" MajorTick-Color="216, 216, 216">
                                    <MajorGridLines Color="216, 216, 216" PenStyle="Solid" />
                                    <TextAppearance TextProperties-Color="51, 51, 51" />
                                </Appearance>--%>
                                <AxisLabel>
                                    <TextBlock>
                                        <Appearance TextProperties-Color="51, 51, 51">
                                        </Appearance>
                                    </TextBlock>
                                </AxisLabel>
                                <%--<Items>
                                        <telerik:ChartAxisItem Value="1">
                                            <TextBlock Text="COMISIONES">
                                            </TextBlock>
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="2">
                                            <TextBlock Text="COMISIONES">
                                            </TextBlock>
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="3">
                                            <TextBlock Text="Activos">
                                            </TextBlock>
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="4">
                                            <TextBlock Text="SAPRES">
                                            </TextBlock>
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="5">
                                            <TextBlock Text="INTERNO">
                                            </TextBlock>
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="6">
                                            <TextBlock Text="Equipos Medicos">
                                            </TextBlock>
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="7">
                                            <TextBlock Text="SAPRES">
                                            </TextBlock>
                                        </telerik:ChartAxisItem>
                                    </Items>--%>
                            </XAxis>
                            <YAxis>
                                <%--<Appearance Color="182, 182, 182" MajorTick-Color="216, 216, 216"
                                    MinorTick-Color="223, 223, 223">
                                    <MajorGridLines Color="216, 216, 216" />
                                    <MinorGridLines Color="223, 223, 223" />
                                    <TextAppearance TextProperties-Color="51, 51, 51">
                                    </TextAppearance>
                                </Appearance>--%>
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
                                <Border Color="182, 182, 182" />
                            </Appearance>
                        </PlotArea>
                        <Appearance Corners="Round, Round, Round, Round, 7">
                            <FillStyle FillType="ComplexGradient">
                                <FillSettings GradientMode="Horizontal">
                                    <%--<ComplexGradient>
                                            <telerik:GradientElement Color="236, 236, 236" />
                                            <telerik:GradientElement Color="248, 248, 248" Position="0.5" />
                                            <telerik:GradientElement Color="236, 236, 236" Position="1" />
                                        </ComplexGradient>--%>
                                </FillSettings>
                            </FillStyle>
                            <Border Color="130, 130, 130" />
                        </Appearance>
                        <ChartTitle>
                            <Appearance>
                                <FillStyle MainColor="">
                                </FillStyle>
                            </Appearance>
                            <TextBlock Text="Administracion Actividades">
                                <Appearance TextProperties-Font="Arial, 18pt"
                                    TextProperties-Color="72, 174, 40">
                                </Appearance>
                            </TextBlock>
                        </ChartTitle>
                        <Legend>
                            <Appearance Dimensions-Margins="0%, 3%, 1px, 1px"
                                Position-AlignedPosition="TopRight"
                                Dimensions-Paddings="2px, 8px, 6px, 3px">
                                <ItemMarkerAppearance Figure="Square">
                                    <Border Width="0" />
                                </ItemMarkerAppearance>
                                <FillStyle MainColor="">
                                </FillStyle>
                                <Border Width="0" />
                            </Appearance>
                        </Legend>
                    </telerik:RadChart>
                </div>
                <div class="row">
                    <h3 class="text-center">HORAS POR PROYECTO </h3>
                    <telerik:RadGrid runat="server" Width="1240"
                        GridLines="None"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        AllowFilteringByColumn="True"
                        PageSize="100"
                        RowStyle-CssClass="gvRowStyle"
                        FilterItemStyle-Width="100%"
                        Height="350px"
                        Style="margin-right: 0px"
                        ID="RadGrid1"
                        DataSourceID="SqlDataSourceRadChart" CellSpacing="0">
                        <GroupingSettings CaseSensitive="false" />
                        <AlternatingItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                        <PagerStyle AlwaysVisible="True"></PagerStyle>
                        <FooterStyle ForeColor="white" />
                        <PagerStyle ForeColor="black" />
                        <HeaderStyle HorizontalAlign="Justify"
                            VerticalAlign="Middle" />
                        <MasterTableView AutoGenerateColumns="false" Width="100%"
                            NoMasterRecordsText="No hay registros para mostrar" EditMode="InPlace"
                            DataSourceID="SqlDataSourceRadChart">
                            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                            <PagerStyle AlwaysVisible="True"></PagerStyle>
                            <HeaderStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="NUsuario" AutoPostBackOnFilter="true"
                                    HeaderText="NUsuario" SortExpression="NUsuario"
                                    UniqueName="NUsuario">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Tema" AutoPostBackOnFilter="true"
                                    HeaderText="Proyecto" SortExpression="Tema" UniqueName="Tema" />
                                <telerik:GridBoundColumn DataField="Cliente" AutoPostBackOnFilter="true"
                                    HeaderText="Cliente" SortExpression="Cliente" UniqueName="Cliente" />
                                <telerik:GridBoundColumn DataField="horas" DataFormatString="{0:00}" AutoPostBackOnFilter="true"
                                    HeaderText="horas" DataType="System.Int32" ReadOnly="True"
                                    SortExpression="horas" UniqueName="horas">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="True" ReorderColumnsOnClient="True" AllowColumnsReorder="True">
                            <Scrolling AllowScroll="True" SaveScrollPosition="true"></Scrolling>
                            <ClientMessages DragToGroupOrReorder="Arrastre para agrupar o reordenar" DragToResize="Arrastre para cambiar tama&ntilde;o" DropHereToReorder="Suelte aqu&iacute; para reordenar" />
                        </ClientSettings>
                        <EditItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                        <SortingSettings SortToolTip="Click aqu&iacute; para ordernar" SortedAscToolTip="Orden ascendente" SortedDescToolTip="Orden descentente" />
                        <PagerStyle AlwaysVisible="true" FirstPageToolTip="Primera p&aacute;gina" LastPageToolTip="&Uacute;ltima p&aacute;gina" NextPagesToolTip="P&aacute;ginas siguientes" NextPageToolTip="P&aacute;gina siguiente" PageSizeLabelText="Mostrar:" PrevPagesToolTip="P&aacute;ginas anteriores" PrevPageToolTip="P&aacute;gina anterior" PagerTextFormat="Cambiar p&aacute;gina: {4} &nbsp;P&aacute;gina <strong>{0}</strong> de <strong>{1}</strong>, registros <strong>{2}</strong> al <strong>{3}</strong> de <strong>{5}</strong>." />
                        <ActiveItemStyle Height="100%" HorizontalAlign="Justify"
                            VerticalAlign="Middle" />
                        <FilterItemStyle Width="100%" HorizontalAlign="Justify" VerticalAlign="Middle"></FilterItemStyle>
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="SqlDataSourceRadChart" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
                        SelectCommand="SELECT 'Administrador' NUsuario
                                            , 'Politecnico Grancolombiano' Cliente
                                            , 'GEMA' Tema
                                            , 1000  as horas  
                                            FROM usuario
                        union all
                        SELECT 'Administrador' NUsuario
                                            , 'Politecnico Grancolombiano' Cliente
                                            , 'Prototipo' Tema
                                            , 2500  as horas  
                                            FROM usuario
                        union all
                        SELECT 'Administrador' NUsuario
                                            , 'Politecnico Grancolombiano' Cliente
                                            , 'Diseño' Tema
                                            , 2000  as horas  
                                            FROM usuario
                         "></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
