﻿<%@ Page Title="" Language="C#" MasterPageFile="Customs.Master" AutoEventWireup="true" CodeBehind="customsrelease.aspx.cs" Inherits="CiroWebsite.customsrelease" %>
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
     <div class="row mt">
    <div class="col-md-12">
      
      
      <div id ="releases" runat="server"  class="toggleview">
        <div class="col-md-12 forum-head">
          <div class="col-md-8 col-sm-8 column lpad">
            Name
          </div>
          <div class="col-md-1  column lpad">
            Owner
          </div>
          <div class="col-md-2 col-sm-4 column lpad">
            Freshness
          </div>
        </div>
        
        <div class="col-md-12 forum-topic">
          <div class="col-md-1 column lpad">
            <i class="icon-file"></i>
          </div>
          <div class="col-md-7 col-sm-8 column lpad">
            <span class="overflow-control">
              <a href="#">Title of the title</a>
            </span>
            <span class="overflow-control">
              Description of the title of the topic(?)
            </span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">96587</span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">678</span>
          </div>
          <div class="col-md-2 small-4 column pad">
            <span>
              <a href="#">Some sub-topic</a>
            </span>
            <span>08-29-2013 7:29PM</span>
            <span>by <a href="javascript:void(0)"  data-toggle="modal" data-target="#deleteItemModal">Some user</a></span>
          </div>
        </div>
        
        <div class="col-md-12 forum-topic">
          <div class="col-md-1 column lpad">
            <i class="icon-tablet"></i>
          </div>
          <div class="col-md-7 col-sm-8 column lpad">
            <span class="overflow-control">
              <a href="#">Oops.. Foundation is supposed to be responsive</a>
            </span>
            <span class="overflow-control">
              But it's not (yet) working here
            </span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">25</span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">2523</span>
          </div>
          <div class="col-md-2 col-sm-4 column pad">
            <span>
              <a href="#">Some sub-topic</a>
            </span>
            <span>08-29-2013 7:29PM</span>
            <span>by <a href="#">Some user</a></span>
          </div>
        </div>
        
        <div class="col-md-12 forum-topic">
          <div class="col-md-1 column lpad">
            <i class="icon-ellipsis-horizontal"></i>
          </div>
          <div class="col-md-7 col-sm-8 column lpad">
            <span class="overflow-control">
              <a href="#">text-overflow: ellipsis;</a>
            </span>
            <span class="overflow-control">
              You can type as many things as you want but the text will be shorter than bla bla bla
            </span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">355</span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">215</span>
          </div>
          <div class="col-md-2 small-4 column pad">
            <span>
              <a href="#">Some sub-topic</a>
            </span>
            <span>08-29-2013 7:29PM</span>
            <span>by <a href="#">Some user</a></span>
          </div>
        </div>
        
        <div class="col-md-12 forum-topic">
          <div class="col-md-1 column lpad">
            <i class="icon-bug"></i>
          </div>
          <div class="col-md-7 col-sm-8 column lpad">
            <span class="overflow-control">
              <a href="#">If you find any bugs is this pen...</a>
            </span>
            <span class="overflow-control">
              ... please tell me in the comments :)
            </span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">255</span>
          </div>
          <div class="col-md-1 column lpad">
            <span class="center">285</span>
          </div>
          <div class="col-md-2 col-sm-4 column pad">
            <span>
              <a href="#">Some sub-topic</a>
            </span>
            <span>08-29-2013 7:29PM</span>
            <span>by <a href="#">Some user</a></span>

          </div>
        </div>

      </div>
    </div>
  </div>
  <!-- delete item Modal -->
<div id="deleteItemModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Package Release</h4>
			</div>
			<div class="modal-body">
				<h5>Are you going to release the item or decline the package</h5>
			</div><!-- .modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal">Accept</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Decline</button>
			</div><!-- .modal-footer -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
   
</asp:Content>
