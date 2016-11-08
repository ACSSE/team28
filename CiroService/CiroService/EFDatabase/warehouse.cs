//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CiroService.EFDatabase
{
    using System;
    using System.Collections.Generic;
    
    public partial class warehouse
    {
        public warehouse()
        {
            this.locations = new HashSet<location>();
            this.warehouseemployees = new HashSet<warehouseemployee>();
            this.warehousestocks = new HashSet<warehousestock>();
            this.warehousetasks = new HashSet<warehousetask>();
        }
    
        public int warehouse_id { get; set; }
        public string warehouse_name { get; set; }
        public string warehouse_location { get; set; }
        public Nullable<int> warehouse_size { get; set; }
        public Nullable<int> warehouse_user { get; set; }
        public Nullable<int> warehouse_warehousetype { get; set; }
        public string warehouse_image { get; set; }
        public string warehouse_description { get; set; }
        public Nullable<System.DateTime> warehouse_established { get; set; }
    
        public virtual ICollection<location> locations { get; set; }
        public virtual user user { get; set; }
        public virtual warehousetype warehousetype { get; set; }
        public virtual ICollection<warehouseemployee> warehouseemployees { get; set; }
        public virtual ICollection<warehousestock> warehousestocks { get; set; }
        public virtual ICollection<warehousetask> warehousetasks { get; set; }
    }
}
