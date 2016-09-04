﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class dischargegoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var declare = Session["declare"] as List<int>;
            var server = new CiroService.Service1Client();
            string body = "";
            foreach (var i in declare)
            {
                var prod = server.getPackageID("" + i);
                body += "<tr>";
                body += "<td>" + prod.name + "</td><td>" + prod.quantity + "</td><td>CalculateAccess</td><td>" + prod.bill + "</td><td>Exit date</td><td>" + prod.cosigner + "</td>";
                body += "</tr>";
            }
            Release.InnerHtml = body;
        }
    }
}