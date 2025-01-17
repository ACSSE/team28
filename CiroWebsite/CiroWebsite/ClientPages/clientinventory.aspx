﻿<%@ Page Title="Depositor | Inventory" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="clientinventory.aspx.cs" Inherits="CiroWebsite.ClientPages.clientinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
    </style>
    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

tbody > tr {
    cursor: pointer;
}

.result{
    margin-top:20px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Warehoused Inventory</h2>
<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>Package Name</th>
			<th>Package Location</th>
			<th >Unit</th>
			<th>Arrival Date</th>
			<th>ERD</th>     
			<th>Status</th>
            <th>Action</th>
		</tr>
	</thead>
								
	<tbody id="list" runat="server">			
	</tbody>
</table>



            <div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabel"><i class="text-muted fa fa-shopping-cart"></i> <strong>02051</strong> - Nome do Produto </h4>
                  </div>
                  <div class="modal-body">
                  
                    <table class="pull-left col-md-8 ">
                         <tbody>
                             <tr >
                                 <td class="h6"><strong>Código</strong></td>
                                 <td> </td>
                                 <td class="h5">02051</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Descrição</strong></td>
                                 <td> </td>
                                 <td class="h5">descrição do produto</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Marca/Fornecedor</strong></td>
                                 <td> </td>
                                 <td class="h5">Marca do produto</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Número Original</strong></td>
                                 <td> </td>
                                 <td class="h5">0230316</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Código N.C.M</strong></td>
                                 <td> </td>
                                 <td class="h5">032165</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Código de Barras</strong></td>
                                 <td> </td>
                                 <td class="h5">0321649843</td>
                             </tr>  

                             <tr>
                                 <td class="h6"><strong>Unid. por Embalagem</strong></td>
                                 <td> </td>
                                 <td class="h5">50</td>
                             </tr>                            

                             <tr>
                                 <td class="h6"><strong>Quantidade Mínima</strong></td>
                                 <td> </td>
                                 <td class="h5">50</td>
                             </tr>

                             <tr>
                                 <td class="h6"><strong>Preço Atacado</strong></td>
                                 <td> </td>
                                 <td class="h5">R$ 35,00</td>
                             </tr> 
                            
                             <tr>
                                 <td class="btn-mais-info text-primary">
                                     <i class="open_info fa fa-plus-square-o"></i>
                                     <i class="open_info hide fa fa-minus-square-o"></i> informações
                                 </td>
                                 <td> </td>
                                 <td class="h5"></td>
                             </tr> 

                         </tbody>
                    </table>
                             
                         
                    <div class="col-md-4"> 
                        <img src="http://lorempixel.com/150/150/technics/" alt="teste" class="img-thumbnail">  
                    </div>
                    
                    <div class="clearfix"></div>
                   <p class="open_info hide">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                  </div>
                    
                  <div class="modal-footer">       
                      
                    <div class="text-right pull-right col-md-3">
                        Varejo: <br/> 
                        <span class="h3 text-muted"><strong> R$50,00 </strong></span></span> 
                    </div> 
                      
                    <div class="text-right pull-right col-md-3">
                        Atacado: <br/> 
                        <span class="h3 text-muted"><strong>R$35,00</strong></span>
                    </div>
                     
                </div>
              </div>
            </div>
            </div>
<!-- fim Modal-->    
    
    
    
    
    
    
    <script>function bingo(id) {
    $(id).modal('show');
}</script>
</asp:Content>
