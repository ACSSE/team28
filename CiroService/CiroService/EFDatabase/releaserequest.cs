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
    
    public partial class releaserequest
    {
        public int releaserequest_id { get; set; }
        public string releaserequest_verdict { get; set; }
        public Nullable<int> releaserequest_user { get; set; }
        public Nullable<int> releaserequest_product { get; set; }
        public string releaserequest_reason { get; set; }
        public Nullable<System.DateTime> releaserequest_requestDate { get; set; }
        public Nullable<System.DateTime> releaserequest_approvalDate { get; set; }
    
        public virtual product product { get; set; }
        public virtual user user { get; set; }
    }
}
