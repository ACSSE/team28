﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class jsonProduct
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public decimal value   { get; set; }
        public int userID { get; set; }
        public int productType { set; get; }
        public int quantity { get; set; }
        public int size { get; set; }
        public DateTime arrivalDate { get; set; }
        public string currentLocation  { get; set; }
        public string transferLocation { get; set; }
        public string bill{ get; set; }
        public string description { get; set; }
        public int insured { get; set; }
        public string origin { get; set; }
        public DateTime expDate {get;set;}

        public int height { set; get; }
        public int length { get; set; }
        public int width { get; set; }

    }
}