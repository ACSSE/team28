
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace CiroService.EFDatabase
{

using System;
    using System.Collections.Generic;
    
public partial class productincident
{

    public int productincident_id { get; set; }

    public string productincident_description { get; set; }

    public string productincident_image { get; set; }

    public Nullable<int> productincident_product_id { get; set; }



    public virtual product product { get; set; }

}

}