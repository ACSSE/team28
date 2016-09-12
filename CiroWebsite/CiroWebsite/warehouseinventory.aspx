﻿<%@ Page Title="" Language="C#" MasterPageFile="~/warehouse.Master" AutoEventWireup="true" CodeBehind="warehouseinventory.aspx.cs" Inherits="CiroWebsite.warehouseinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style type="text/css">
.p-table th,
.p-table td {
    vertical-align: middle !important;
}


.p-team img {
    width: 35px;
    height:35px;
    border-radius: 4px;
}

.p-progress .progress {
    margin-bottom: 5px;
}

.p-name a {
    font-size:14px;
    /*font-weight:bold;*/
}

.bold {
    font-weight: bold;
}

.p-details .bio-row p span {
    width: auto;
}

.p-details .bio-row p span.bold {
    width: 100px;
}

.p-team a {
    display: inline-block;
}

.project-heading {
    font-size: 20px;
}

.mtop20 {
    margin-top: 20px;
}

.p-files li a {
    margin-bottom: 10px;
    color: #949494;
    display: block;
}

.p-files li i {
    padding-right: 10px;
    width: 20px;
}

.p-tag-list li {
    display: inline-block;
    margin:0 5px 7px 0;
}

.p-tag-list li a {
    display: inline-block;
    border: 1px solid #ddd;
    padding: 3px 10px;
    color:#797979;
    border-radius: 4px;
    font-size:12px;
}

.p-tag-list li a:hover {
    background: #ff6c60;
    border-color: #ff6c60;
    color:#fff;
}

.m-thumb img {
    width: 100%;
    border:1px solid #ddd;
}




.btn-default {
    background-color: #bec3c7;
    border-color: #bec3c7;
    color: #fff;
}

.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
    background-color: #b0b5b9;
    border-color: #b0b5b9;
    color: #fff;
}

.btn-primary ,
.btn-primary.disabled,
.btn-primary[disabled],
.btn-primary.disabled.active,
.btn-primary.active[disabled]{
    background-color: #41cac0;
    border-color: #41cac0;
    color: #FFFFFF;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open .dropdown-toggle.btn-primary,
.btn-primary.disabled,
.btn-primary[disabled],
.btn-primary.disabled.active,
.btn-primary.active[disabled]{
    background-color: #39b2a9;
    border-color: #39b2a9;
    color: #FFFFFF;
}

.btn-success {
    background-color: #78CD51;
    border-color: #78CD51;
    color: #FFFFFF;
}

.btn-success:hover, .btn-success:focus, .btn-success:active, .btn-success.active, .open .dropdown-toggle.btn-success {
    background-color: #6dbb4a;
    border-color: #6dbb4a;
    color: #FFFFFF;
}

.btn-info {
    background-color: #58c9f3;
    border-color: #58c9f3;
    color: #FFFFFF;
}

.btn-info:hover, .btn-info:focus, .btn-info:active, .btn-info.active, .open .dropdown-toggle.btn-info {
    background-color: #53bee6;
    border-color: #53BEE6;
    color: #FFFFFF;
}

.btn-warning {
    background-color: #f1c500;
    border-color: #f1c500;
    color: #FFFFFF;
}

.btn-warning:hover, .btn-warning:focus, .btn-warning:active, .btn-warning.active, .open .dropdown-toggle.btn-warning {
    background-color: #e4ba00;
    border-color: #e4ba00;
    color: #FFFFFF;
}

.btn-danger {
    background-color: #ff6c60;
    border-color: #ff6c60;
    color: #FFFFFF;
}

.btn-danger:hover, .btn-danger:focus, .btn-danger:active, .btn-danger.active, .open .dropdown-toggle.btn-danger {
    background-color: #ec6459;
    border-color: #ec6459;
    color: #FFFFFF;
}


.btn-white {
    box-shadow: none !important;
}



.label {
    padding: 0.5em 0.8em;
}

.label-default {
    background-color: #a1a1a1;
}

.label-primary {
    background-color: #59ace2;
}

.label-success {
    background-color: #A9D86E;
}

.label-info {
    background-color: #8175c7;
}

.label-warning {
    background-color: #FCB322;
}

.label-danger {
    background-color: #FF6C60;
}

.label-inverse {
    background-color: #344860;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
                  <header class="panel-heading">
                      Inventory
                  </header>
                  <div class="panel-body">
                      <div class="row">
                          <div class="col-md-4">
                              <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control"> <span class="input-group-btn">
                              <button type="button" class="btn btn-sm btn-success"> Go!</button> </span></div>
                          </div>
                      </div>
                  </div>
                  <table class="table table-hover p-table">
                      <thead>
                      <tr>
                          <th>Name</th>
                          <th>Owner</th>
                          <th>Package Type</th>
                          <th>Available</th>
                          <th>Status</th>
						  <th>Last Modified</th>
                           <th>Action</th>

                      </tr>
                      </thead>
                      <tbody runat="server" id="warehouseStock"> 

                     
                      </tbody>
                  </table>
              </section>
</asp:Content>
