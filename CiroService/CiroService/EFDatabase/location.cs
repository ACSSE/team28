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
    
    public partial class location
    {
        public int location_id { get; set; }
        public Nullable<int> location_isle { get; set; }
        public Nullable<int> location_column { get; set; }
        public Nullable<int> location_row { get; set; }
        public Nullable<int> location_size { get; set; }
        public Nullable<int> location_product { get; set; }
        public Nullable<int> location_warehouse { get; set; }
        public Nullable<int> location_height { get; set; }
        public Nullable<int> location_width { get; set; }
        public Nullable<int> location_length { get; set; }
        public Nullable<int> location_reserve { get; set; }
    
        public virtual product product { get; set; }
        public virtual warehouse warehouse { get; set; }
    }
}
