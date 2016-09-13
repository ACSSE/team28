﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class transfergoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["transfer"] != null)
            {
                Session["transferProduct"] = Request.QueryString["transfer"];
            }
            if (Request.QueryString["w"] != null)
            {
                Session["warehouse"] = Request.QueryString["w"];
                // Response.Redirect("transfergoods.aspx/step2");
                Response.RedirectLocation = "step2";
            }
        }

        protected void saveInfo(object sender, EventArgs e)
        {
          // Session["TransferInfo"] = new TransferForm { origin = origincountry.Value, mass = Convert.ToDouble(mass.Value), transport = transport.Value, transferReason = reason.Value, description = description.Value };
        }

        protected void completeRequest(object sender, EventArgs e)
        {
            var ser = new CiroService.Service1Client();
            var transInfo = Session["TransferInfo"] as TransferForm;
            var productIDt = Convert.ToInt32(Session["transferProduct"]);
            var user = (CiroService.JsonUser)Session["user"];
            MessageBox.Show(user.id+"User ID");
            MessageBox.Show(transInfo.description);
            MessageBox.Show(Convert.ToInt32(Session["warehouse"]) + "Warehouse ID");
            MessageBox.Show(productIDt+"Product ID");
            CiroSingleton .ServerCalls .transeferRequest(new CiroService.jsonTRequest { userID = user.id, description = transInfo.description, endWarehouse = Convert.ToInt32(Session["warehouse"]), productID = productIDt });
        }

        protected void listwarehouse()
        {
            var warehouses = new CiroService.Service1Client().warehouses();
            var body = "";
            var count = 1;

            foreach (var w in warehouses)
            {

                body += "<td>";
                body += "<table class='table' style='width:350px'>";
                body += "<tr><th colspan='5'><b>" + w.name + "</b></th></tr>";
                body += "<tr><td colspan='5'><img src='out.jpg' alt='Mountain View' style='width:100px;height:100px;'><div style='float:right;'>Location :" + w.location + "<br/>Type:" + w.warehousetype + "<br/><a class='btn btn-outline mw-md rounded btn-success btn-xs'>View Warehose</a><br/><a href='transfergoods.aspx?w=" + w.id + "' class='btn btn-outline mw-md rounded btn-success btn-xs'>Select Warehose</a></div></td></tr>";
                body += "</table>";
                body += "</td>";
                if (count % 3 == 0)
                {
                    body += "<tr></tr>";
                }
                count++;
            }
            Response.Write(body);
        }
    }
}