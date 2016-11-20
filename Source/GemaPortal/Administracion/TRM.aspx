<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TRM.aspx.cs" Inherits="TRM" %>

<asp:Content runat="server" ID="parametros" ContentPlaceHolderID="MainContent">    
    <div class="container col-xs-8 col-md-5" style="padding-top:50px !Important">
        <asp:GridView ID="GridView_Clientes" runat="server" DataSourceID="SqlDataSource1"
        AutoGenerateColumns="False" 
        CssClass="table table-bordered bs-table" 
        DataKeyNames="ClienteID" 
        allowpaging="true" >
 
        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#ffffcc" />
        <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
        <emptydatatemplate>
            ¡No hay clientes con los �metros seleccionados!  
        </emptydatatemplate>           
 
        <%--Paginador...--%>        
        <pagertemplate>
        <div class="row" style="margin-top:20px;">
            <div class="col-lg-1" style="text-align:right;">
                <h5><asp:label id="MessageLabel" text="Ir a la pág." runat="server" /></h5>
            </div>
             <div class="col-lg-1" style="text-align:left;">
                <asp:dropdownlist id="PageDropDownList" Width="50px" runat="server" CssClass="form-control" /></h3>
            </div>
            <div class="col-lg-10" style="text-align:right;">
                <h3><asp:label id="CurrentPageLabel" runat="server" CssClass="label label-warning" /></h3>
            </div>
        </div>        
        </pagertemplate>             
 
        <Columns>
            <%--CheckBox para seleccionar varios registros...--%>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70px">
                <ItemTemplate>
                    <asp:CheckBox ID="chkEliminar" runat="server"  />
                </ItemTemplate>
            </asp:TemplateField>            
 
            <%--botones de acción sobre los registros...--%>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="200px">
                <ItemTemplate>
                    <%--Botones de eliminar y editar cliente...--%>
                    <asp:Button ID="btnDelete" runat="server" Text="Quitar" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('¿Eliminar cliente?');" />
                    <asp:Button ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit" />
                </ItemTemplate>
                <edititemtemplate>
                    <%--Botones de grabar y cancelar la edición de registro...--%>
                    <asp:Button ID="btnUpdate" runat="server" Text="Grabar" CssClass="btn btn-success" CommandName="Update" OnClientClick="return confirm('¿Seguro que quiere modificar los datos del cliente?');" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" />
                </edititemtemplate>
            </asp:TemplateField>
 
            <%--campos no editables...--%>
            <asp:BoundField DataField="ClienteID" HeaderText="Nº" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" ControlStyle-Width="70px" />
            <asp:BoundField DataField="CustomerID" HeaderText="Cód." InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" ControlStyle-Width="70px" />
            <asp:BoundField DataField="CompanyName" HeaderText="Compañía" ReadOnly="True" SortExpression="CompanyName" ControlStyle-Width="300px" />
            <asp:BoundField DataField="Country" HeaderText="Pais" ReadOnly="True" SortExpression="Country" />
 
            <%--campos editables...--%>
            <asp:TemplateField HeaderStyle-Width="300px" HeaderText="Contacto">
                <ItemTemplate>
                    <asp:Label id="lblContactName" runat="server"><%# Eval("ContactName")%></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TxtContactName" runat="server" Text='<%# Bind("ContactName")%>' CssClass="form-control" ></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Teléfono">
                <ItemTemplate>
                    <asp:Label id="lblPhone" runat="server"><%# Eval("Phone")%></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TxtPhone" runat="server" Text='<%# Bind("Phone")%>' CssClass="form-control" ></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataSourceBaseDatos %>" 
        
        SelectCommand="SELECT 
            1 ClienteID, '8763284' CustomerID, 'Exito' CompanyName, 'Colombia' Country, 'hola' ContactName, '87628374' Phone">
    </asp:SqlDataSource>
    </div>
    <div class="col-md-6" >
        <%--<telerik:RadHtmlChart runat="server" ID="AreaChart" Width="640px" Height="480px">
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
        </telerik:RadHtmlChart>--%>
    </div>
</asp:Content>
