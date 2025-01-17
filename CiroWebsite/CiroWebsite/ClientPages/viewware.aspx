﻿<%@ Page Title="" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="viewware.aspx.cs" Inherits="CiroWebsite.viewware" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../infinity/assets/css/style.css">
      <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="../infinity/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="../infinity/css/nouislider.css">
    <!-- Fancybox slider -->
    <link rel="stylesheet" href="../infinity/css/jquery.fancybox.css" type="text/css" media="screen" /> 
    <!-- Theme color -->
    <link id="switcher" href="../infinity/css/theme-color/default-theme.css" rel="stylesheet"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
  <!-- Start Proerty header  s>

  <section id="aa-property-header">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-property-header-inner">
            <h2>Warehouse Details</h2>
            <ol class="breadcrumb">
            <li><a href="#">HOME</a></li>            
            <li class="active">View Warehouse</li>
          </ol>
          </div>
        </div>
      </div>
    </div>
  </section> 
  < End Proerty header  -->

  <!-- Start Properties  -->
  <section id="aa-properties">
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="aa-properties-content"> 
                        
            <!-- Start properties content body -->
            <div class="aa-properties-details">
             <h2>Name</h2> 
                <p id="wName" runat="server"></p>
            <h3>Location</h3>
                <p id="loc" runat="server"></p>
             <div runat="server" id="imgDiv" class="aa-properties-details-img">
             </div>
             <div class="aa-properties-info" runat="server" id="warehouseInfo">
               <h2>Warehouse Description</h2>
               <p runat="server" id="description"></p>
               <h4>Warehouse Map</h4>
               <!--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6851.201919469417!2d-86.11773906635584!3d33.47324776828677!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x888bdb60cc49c571%3A0x40451ca6baf275c7!2s36008+AL-77%2C+Talladega%2C+AL+35160%2C+USA!5e0!3m2!1sbn!2sbd!4v1460452919256" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>-->
             </div>
             

            </div>           
          </div>
        </div>
        <div class="col-md-4">
         <!--  <aside class="aa-properties-sidebar">
           
            Start Single properties sidebar 
            <div class="aa-properties-single-sidebar">
              <h3>Other Warehouses</h3>
              <div class="media">
                <div class="media-left">
                  <a href="#">
                    <img class="media-object" src="img/item/1.jpg" alt="img">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading"><a href="#">This is Title</a></h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                  <span>$65000</span>
                </div>              
              </div>
              <div class="media">
                <div class="media-left">
                  <a href="#">
                    <img class="media-object" src="img/item/1.jpg" alt="img">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading"><a href="#">This is Title</a></h4>
                  <p id="name" runat="server"></p>                
                </div>              
              </div>
              <div class="media">
                <div class="media-left">
                  <a href="#">
                    <img class="media-object" src="img/item/1.jpg" alt="img">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading"><a href="#">This is Title</a></h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                  <span>$65000</span>
                </div>              
              </div>
            </div>
          </aside>-->
        </div>
      </div>
           <!-- jQuery library -->
  <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
  <script src="infinity/js/jquery.min.js"></script>   
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../infinity/js/bootstrap.js"></script>   
  <!-- slick slider -->
  <script type="text/javascript" src="../infinity/js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="../infinity/js/nouislider.js"></script>
   <!-- mixit slider -->
  <script type="text/javascript" src="../infinity/js/jquery.mixitup.js"></script>
  <!-- Add fancyBox -->        
  <script type="text/javascript" src="../infinity/js/jquery.fancybox.pack.js"></script>
  <!-- Custom js -->
  
</asp:Content>
