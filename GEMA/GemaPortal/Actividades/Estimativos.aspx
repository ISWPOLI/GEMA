<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estimativos.aspx.cs" Inherits="Estimativos" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">    
    <div class="container">
        <h3 class="text-center">ESTIMATIVOS </h3>
        <div class="col-md-3">
            <telerik:RadTreeView ID="RadTreeCLientes" runat="server" Width="100%" Height="600px"
                DataFieldID="IdCliente" DataFieldParentID="idparent" DataTextField="Nombre"
                DataSourceID="SqlDataSource1" >
                <DataBindings>
                    <telerik:RadTreeNodeBinding Expanded="false" />
                </DataBindings>
            </telerik:RadTreeView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
                SelectCommand="select idcliente , null as idparent, razonsocial as nombre
                                                            from [Cliente]
                                                            union
                                                            SELECT  idcliente + 10000 , IdCliente as idparent, 'Proyecto' as nombre
                                                            FROM  cliente " />

            <telerik:RadTextBox runat="Server" ID="NodeTextBox" EmptyMessage="Nombre Proyecto" Width="90px" Visible="false"></telerik:RadTextBox>
            <telerik:RadTextBox runat="Server" ID="txtAgregarCLiente" EmptyMessage="NombreCliente" Width="90px" Visible="true"></telerik:RadTextBox>

            <asp:Button CssClass="boton" ID="btoAgregar" runat="server" Text="Agregar" Visible="false"></asp:Button>
            <asp:Button CssClass="boton" ID="btoAgregarCliente" runat="server" Text="Agregar" Visible="true"></asp:Button>
        </div>
        <div class="col-md-9 pull-right">
            <div class="row" style="padding-top: 10px">
                <div class="col-md-3">
                    <asp:Label ID="lbl" runat="server" Text="Nombre estimativo" CssClass="lbltexto" Height="30px" Width="140px"></asp:Label>
                </div>
                <div class="col-md-3">
                    <telerik:RadTextBox runat="Server" ID="RadTextBox1" CssClass="form-control" Width="100%" Visible="true"></telerik:RadTextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnNuevaActividad" runat="server" Text="Crear" CssClass="btn btn-block btn-primary" Visible="true" />
                </div>
            </div>
            <telerik:RadGrid ID="RadGridActividades"
                AllowSorting="true"
                AllowPaging="true"
                AllowFilteringByColumn="true"
                ShowFooter="false" ShowGroupPanel="true"
                AutoGenerateColumns="false" runat="server"
                DataSourceID="SqlDataSource2" PageSize="30"
                GridLines="None" CellSpacing="0" Culture="es-ES" Width="100%" Height="450px">
                <GroupingSettings CaseSensitive="false" />
                <PagerStyle Mode="NextPrevAndNumeric" />
                <ClientSettings>
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <ExportSettings Excel-Format="Biff" IgnorePaging="true"></ExportSettings>
                <MasterTableView CommandItemDisplay="top"
                    EditMode="InPlace"
                    HorizontalAlign="Center"
                    CommandItemSettings-ShowAddNewRecordButton="false"
                    CommandItemSettings-ShowRefreshButton="false"
                    CommandItemSettings-ShowExportToExcelButton="true">
                    <Columns>
                        <%--<telerik:GridBoundColumn Aggregate="Count" DataField="id_actividad" HeaderText="ID Actividad" FooterText="Total Acitividades: " HeaderStyle-Width="120px" ItemStyle-Width="120px" FilterControlWidth="60px" AutoPostBackOnFilter="true" />
                        <telerik:GridBoundColumn DataField="NombreCompleto" HeaderText="Nombre Completo" HeaderStyle-Width="120px" ItemStyle-Width="120px" AutoPostBackOnFilter="true" />--%>
                        <telerik:GridBoundColumn DataField="Tema" HeaderText="Proyecto" HeaderStyle-Width="120px" ItemStyle-Width="120px" AutoPostBackOnFilter="true" />
                        <telerik:GridBoundColumn DataField="Cliente" HeaderText="Cliente" HeaderStyle-Width="120px" ItemStyle-Width="120px" FilterControlWidth="80px" AutoPostBackOnFilter="true" />
                        <telerik:GridBoundColumn DataField="TipoActividad" HeaderText="Tipo" HeaderStyle-Width="120px" ItemStyle-Width="120px" FilterControlWidth="80px" AutoPostBackOnFilter="true" />
                        <telerik:GridDateTimeColumn DataField="fecha_inicio" HeaderText="Fecha Inicio" AllowSorting="true" FilterControlWidth="90px" HeaderStyle-Width="120px" ItemStyle-Width="120px" AutoPostBackOnFilter="true" />
                        <telerik:GridDateTimeColumn DataField="fecha_fin" HeaderText="Fecha Fin" FilterControlWidth="90px" HeaderStyle-Width="120px" ItemStyle-Width="120px" AutoPostBackOnFilter="true" />
                        <telerik:GridBoundColumn Aggregate="Sum" DataField="horas" HeaderText="Horas" FooterText="TotalHoras: " MaxLength="500" HeaderStyle-Width="80px" ItemStyle-Width="80px" FilterControlWidth="40px" AutoPostBackOnFilter="true" />
                        <telerik:GridBoundColumn DataField="Encabezado" HeaderText="Encabezado" MaxLength="500" HeaderStyle-Width="150px" ItemStyle-Width="150px" FilterControlWidth="100px" AutoPostBackOnFilter="true" />
                        <telerik:GridBoundColumn DataField="descripcionMostrar" HeaderText="Descripción" MaxLength="500" HeaderStyle-Width="120px" ItemStyle-Width="120px" FilterControlWidth="80px" AutoPostBackOnFilter="true" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
           
        </div>
    </div>
    <asp:SqlDataSource ID="DataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
        SelectCommand="SELECT 'desarrollo', 300 / 60 AS horasXActividad FROM Usuario where idUsuario = 1 GROUP BY nombreActividad"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
        SelectCommand="SELECT 1 id_actividad, 'Administrador' NombreCompleto, 'GEMA' Tema,
        'Politecnico Grancolombiano' Cliente, 'Prototipo' TipoActividad, getdate() fecha_inicio, getdate() fecha_fin, 80 horas,
        'Prototipo de la aplicacion' Encabezado, 'Estimación de prototipado' descripcionMostrar FROM Usuario"></asp:SqlDataSource>
</asp:Content>
