<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroActividades.aspx.cs" Inherits="RegistroActividades" %>

<asp:Content runat="server" ID="bandejaPrinipal" ContentPlaceHolderID="MainContent">
    <div class="container">
        <h3 class="text-center">RESÚMEN DE HORAS POR TIPO DE ACTIVIDAD EN EL MES </h3>

        <div class="row text-right">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label  ID="LblNumDoc" runat="server" Text="Usuario" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:TextBox ID="TextBox1" runat="server" Width="100%" Style="margin-left: 0px" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblCliente" runat="server"  Text="Cliente" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:DropDownList ID="ddCliente" runat="server" Width="100%" CssClass="form-control" />
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblTema" runat="server"  Text="Tema" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:DropDownList ID="ddTema" runat="server" Width="100%"  CssClass="form-control"/>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblTipoActividad" runat="server"  Text="Tipo Actividad" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:DropDownList ID="ddTipoActividad" runat="server" Width="100%" CssClass="form-control"/>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="Label1" runat="server"  Text="Encabezado Actividad" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:TextBox ID="txtEncabezadoActividad" runat="server" Width="100%" Style="margin-left: 0px" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblFecha" runat="server"  Text="Fecha" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <telerik:RadDatePicker ID="dtFecha" runat="server" Width="100%" AutoPostBack="false"
                    MinDate="01/01/1000" MaxDate="01/01/3000">
                    <Calendar ID="Calendar2" runat="server" CssClass="texto_obligatorio">
                        <SpecialDays>
                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-CssClass="rcToday">
                                <ItemStyle CssClass="rcToday" />
                            </telerik:RadCalendarDay>
                        </SpecialDays>
                    </Calendar>
                    <DateInput ID="DateInput1" runat="server" AutoPostBack="True" DateFormat="dd/MM/yyyy"
                        DisplayDateFormat="dd/MM/yyyy" Height="22px">
                    </DateInput>
                </telerik:RadDatePicker>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblHoraInicio" runat="server"   Text="Hora Inicio" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <telerik:RadTimePicker ID="tpHoraInicio" runat="server" ZIndex="30001"
                     Width="100%">
                    <Calendar ID="Calendar1" runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                        ViewSelectorText="x">
                    </Calendar>
                    <DateInput ID="DateInput2" runat="server" DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" LabelCssClass=""
                        Width="">
                    </DateInput>
                </telerik:RadTimePicker>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblHoraFin" runat="server"  Text="Hora Fin" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <telerik:RadTimePicker ID="tpHoraFin" runat="server" ZIndex="30001"
                    Width="100%">
                    <Calendar ID="Calendar3" runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                        ViewSelectorText="x">
                    </Calendar>
                    <DateInput ID="DateInput3" runat="server" DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" LabelCssClass=""
                        Width="">
                    </DateInput>
                </telerik:RadTimePicker>
            </div>
        </div>
        <div class="row text-right" style="padding-top: 10px">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Label ID="lblDescActividad" runat="server" Text="Descripcion Actividad" Width="100%"></asp:Label>
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:TextBox ID="txtDescActividad" runat="server" Height="120px" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </div>
        </div>
        <div class="row text-right">
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Button ID="btnRegistrarActividad" runat="server" CssClass="btn btn-block btn-primary" Text="Guardar" ValidationGroup="validacionActuacion" OnClick="btnVolver_Click" />
            </div>
            <div class="col-sm-6 col-md-3">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-block btn-primary" OnClick="btnVolver_Click" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="DataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>"
        SelectCommand="SELECT 'desarrollo', 300 / 60 AS horasXActividad FROM Usuario where idUsuario = 1 GROUP BY nombreActividad"></asp:SqlDataSource>
</asp:Content>
