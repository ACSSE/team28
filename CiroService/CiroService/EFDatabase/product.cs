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
    
    public partial class product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product()
        {
            this.billofentries = new HashSet<billofentry>();
            this.locations = new HashSet<location>();
            this.ownershiprequests = new HashSet<ownershiprequest>();
            this.productlogs = new HashSet<productlog>();
            this.releaserequests = new HashSet<releaserequest>();
            this.transferlists = new HashSet<transferlist>();
            this.transferrequests = new HashSet<transferrequest>();
            this.warehousestocks = new HashSet<warehousestock>();
        }
    
        public int product_id { get; set; }
        public string product_name { get; set; }
        public Nullable<decimal> product_price { get; set; }
        public Nullable<int> product_quantity { get; set; }
        public Nullable<int> product_size { get; set; }
        public string product_location { get; set; }
        public Nullable<System.DateTime> product_arrivalDate { get; set; }
        public Nullable<int> product_width { get; set; }
        public Nullable<int> product_height { get; set; }
        public Nullable<int> product_length { get; set; }
        public Nullable<int> product_producttype { get; set; }
        public Nullable<int> product_hscode { get; set; }
        public string product_image { get; set; }
        public Nullable<System.DateTime> product_exitdate { get; set; }
        public string product_Expired { get; set; }
        public string product_receipt { get; set; }
        public string product_description { get; set; }
        public Nullable<System.DateTime> product_expirationDate { get; set; }
        public Nullable<int> product_Insured { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<billofentry> billofentries { get; set; }
        public virtual hscode hscode { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<location> locations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ownershiprequest> ownershiprequests { get; set; }
        public virtual producttype producttype { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<productlog> productlogs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<releaserequest> releaserequests { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transferlist> transferlists { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transferrequest> transferrequests { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<warehousestock> warehousestocks { get; set; }
    }
}
