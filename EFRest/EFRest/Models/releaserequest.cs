//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EFRest.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class releaserequest
    {
        public int releaserequest_id { get; set; }
        public string releaserequest_description { get; set; }
        public Nullable<int> user_id_releaserequest { get; set; }
        public Nullable<int> product_id_releaserequest { get; set; }
    
        public virtual product product { get; set; }
        public virtual user user { get; set; }
    }
}
