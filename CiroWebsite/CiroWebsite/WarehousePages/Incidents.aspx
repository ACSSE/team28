﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WarehousePages/warehouse.Master" AutoEventWireup="true" CodeBehind="Incidents.aspx.cs" Inherits="CiroWebsite.WarehousePages.Incidents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        @import url(http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Open+Sans+Condensed:300,700);
        header {
          background-image: url('http://subtlepatterns.com/patterns/use_your_illusion.png');
          margin: 0;
          border-bottom: 3px solid hsl(195, 73%, 58%);
        }
        a {
          display: inline-block;
  
          color: inherit;
          text-decoration: none;
        }
        .row.mt { margin-top: 1.25em; }
        .row.mb { margin-bottom: 1.25em; }
        .pad { padding: 15px; }
        .spad { padding: 5px; }
        .lpad { padding: 20px;}
        .ar { text-align: right; }
        .logo {
          color: hsl(0, 0%, 100%);
          font-size: 18px; 
          text-transform: lowercase;
        }
        .logo span:first-child {
          font-weight: 400;
        }
        .logo span:last-child {
          color: hsl(0, 0%, 70%);
          font-weight: 300;
        }
        nav.menu a {
          margin: 0 7px;
          color: hsl(0, 0%, 70%);
          font-size: 12px;
          font-weight: 600;
          text-decoration: none;
        }
        nav.menu a:last-child {
            margin: 7px 0 7px 7px;
        }
        nav.menu a.current {
          color: hsl(0, 0%, 100%);
        }
        .top-msg {
          border-bottom: 5px solid hsla(0, 0%, 90%, .3);
  
          color: hsl(0, 0%, 40%);
          font-size: 13px;
          font-weight: 300;
        }
        .breadcrumb a {
          transition: color .5s;
        }
        .breadcrumb a:hover {
          color: hsl(0, 0%, 20%);
        }
        .breadcrumb a:after {
          content: '\00a0\00a0\002F\00a0\00a0';
          color: hsl(0, 0%, 70%);
        }
        .breadcrumb a:last-child:after {
          content: '\00a0\00a0\002F\00a0\00a0 now you\0027re here';
          color: hsl(0, 0%, 70%);
        }
        a.primary {
          color: hsl(0, 0%, 70%);
          transition: color .5s;
        }
        a.primary:hover {
          color: hsl(195, 73%, 58%);
        }
        a.underline {
          color: hsl(0, 0%, 70%);
        }
        a.underline:hover:after {
          content: '';
          display: block;
          width: inherit;
          height: 2px;
          background-color: hsl(195, 73%, 58%);
          margin-bottom: -2px;
          animation: link .9s ease;
        }
        @keyframes link {
          from { width: 0; }
          to   { width: 100%;}
        }
        /* Topic */
        .rounded {
          overflow: hidden;
        }
        .rounded.top {
          border-radius: 4px 4px 0 0;
        }
        .rounded.all {
          border-radius: 4px;
        }
        .forum-category {
          background-color: hsl(195, 73%, 58%);
  
          color: hsl(0, 0%, 100%);
          font-weight: 600;
          font-size: 13px;
          text-shadow: 0 1px 1px hsl(195, 73%, 40%);
        }
        .forum-head > .column {
          background-color: hsl(206, 35%, 13%);
          border-right: 1px solid hsl(212, 35%, 15%);
          border-left: 1px solid hsl(212, 28%, 12%);
  
          color: hsl(0, 0%, 100%);
          font-weight: 300;
          font-size: 12px;
          text-shadow: 0 1px 1px hsl(0, 0%, 0%);
          text-align: center;
        }
        .forum-head > .column:first-child {
          text-align: left;
          border-left: none;
        }
        .forum-head > .column:last-child {
          border-right: none;
        }
        .forum-topic > .column {
          min-height: 71px;
          max-height: 71px;
          background-color: hsl(0, 0%, 96%);
          border-bottom: 1px solid hsl(0, 0%, 90%);
          color: hsl(0, 0%, 50%);
          font-size: 12px;
        }
        .forum-topic > .column:first-child {
          color: hsl(0, 0%, 60%);
          font-size: 30px;
          text-align: center;
        }
        .forum-topic > .column:nth-child(n+3) {
          text-align: center;
        }
        .forum-topic > .column:last-child {
          text-align: left;
        }
        .forum-topic a {
          transition: color .5s;
  
          color: hsl(195, 73%, 58%);
          font-weight: 600;
        }
        .forum-topic a:hover {
          color: hsl(195, 73%, 48%);
        }
        .forum-topic span {
          display: block;
          margin: 0 0 2px 0;
        }
        .overflow-control {
          white-space: nowrap;
          overflow: hidden;
          text-overflow:ellipsis;
        }
        .forum-topic .column:nth-child(2) span.overflow-control {
          width: 70%;
          height: 15px;
        }
        .forum-topic span.center {
          padding-top: 10px;
        }
        .normal {
          background-color: hsl(0, 0%, 96%);
  
          color: hsl(0, 0%, 50%);
          font-size: 12px;
        }
        .normal h1.inset {
          background-color: hsl(206, 35%, 13%);  
          margin: -20px -20px 20px -20px;
  
          color: hsl(0, 0%, 100%);
          padding: 15px 20px 15px 20px;
          font-size: 12px;
          font-weight: 300;
        }
        .normal p {
          margin: 0 0 40px 0;
          line-height: 20px;
        }
        .normal p:last-child {
          margin: 0;
        }
        #top-button {
          display: none;
          width: 27px;
          background-color: hsl(206, 35%, 13%);
          position: fixed;
          right: 60px;
          bottom: 20px;
          border-radius: 3px;
          cursor: pointer;
  
          padding: 5px;
          text-align: center;
          color: hsl(0, 0%, 100%);
        }
        #top-button.show {
          display: block;
        }
        @media only screen and (max-width: 768px) {
          header {
            fz
          }
          .logo,
          nav { 
            text-align: center; 
          }
          nav.menu a {
            margin: 7px;
          }
          .breadcrumb,
          .forum-head > .column:nth-child(2),
          .forum-head > .column:nth-child(3),
          .forum-topic > .column:first-child,
          .forum-topic > .column:nth-child(3),
          .forum-topic > .column:nth-child(4),
          #top-button {
            display: none;
          }
          .forum-category > span,
          .forum-category > .column:first-child,
          .forum-head > .column,
          .forum-topic > .column,
          .normal,
          .normal h1.inset {
            font-size: 10px;
            text-align: left;
          }
          .forum-head > .column {
            color: hsl(0, 0%, 100%);
            border: none;
            font-weight: 600;
          }
          .rounded,
          .rounded.top,
          .rounded.all {
            border-radius: 0;
          }
          .overflow-control > a,
          .overflow-control {
            display: block;
            width: 290px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
          }
          .breadcrumb a:nth-child(2) { margin: 3px 0 3px 10px; }
          .breadcrumb a:nth-child(3) { margin: 3px 0 3px 20px; }
          .breadcrumb a:nth-child(4) { margin: 3px 0 3px 30px; }
          .breadcrumb a:after {
            display: none;
          }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
			<div class="col-md-12">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Warehouse Incidents</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="table-responsive">
							<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>Name</th>
										<th>Description</th>
										<th>Reported By</th>
										<th>Date Issued</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Description</th>
										<th>Reported By</th>
										<th>Date Issued</th>
									</tr>
								</tfoot>
								<tbody runat="server" id="getIncident">
									
								</tbody>
							</table>
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

</asp:Content>