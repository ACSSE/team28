﻿<%@ Page Title="" Language="C#" MasterPageFile="Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Project_Ciro.Home.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="login-box" style="margin-top:4%">
  <div class="login-logo">
    <a href="Home.aspx"><b>CIRO</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body" style="box-shadow: 10px 10px 5px grey;" >
    <p class="login-box-msg">Register A New Membership</p>

    <form method="post">
        <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="First Name"/>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
        <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Surname"/>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email"/>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
         <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Confirm Password"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label style="margin-left:5px">
              <input type="checkbox"/> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

   <!-- <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->
   
    <a href="login.aspx" class="text-center">I Already have A membership</a>

  </div> 
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
</asp:Content>
