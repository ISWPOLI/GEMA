<%@ Page Language="C#" MasterPageFile="~/SimpleSite.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="GEMA.Inicio" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolderSimpleSite">
    
<div class="container" style="margin-top:130px; background:none !Important">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Inicar sesión</strong>
					</div>
					<div class="panel-body" style="background:none !Important;">
						<form role="form" action="#" method="POST">
							<fieldset>
								<div class="row">
									<div class="center-block">
										<img class="profile-img" src="Images/NoPhoto.png" alt="" />
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
                                                <asp:TextBox ID="txtUsuario" runat="server" class="form-control" placeholder="Username" name="loginname" autofocus="true"/>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-lock"></i>
												</span>
                                                <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" name="password" TextMode="Password" />
											</div>
										</div>
										<div class="form-group">
                                            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btn btn-lg btn-primary btn-block" OnClick="btnIngresar_Click" />
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
					<%--<div class="panel-footer ">
						¿Olvidó su contraseña? <a href="#" onClick=""> Click aqui para recuperar su contraseña </a>
					</div>--%>
                </div>
			</div>
		</div>
	</div>
</asp:Content>