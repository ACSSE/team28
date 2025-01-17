﻿using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class billofentryController : IDatabaseOperator<billofentry>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<billofentry> addRecord(billofentry billofentry)
        {

            db.billofentries.Add(billofentry);
            db.SaveChanges();

            return db.billofentries;
        }

        public IEnumerable<billofentry> deleteRecord(int id)
        {
            billofentry billofentry = db.billofentries.Find(id);
            if (billofentry == null)
            {
                return null;
            }

            db.billofentries.Remove(billofentry);
            db.SaveChanges();

            return db.billofentries;
        }

        public bool exists(int id)
        {
            return db.billofentries.Count(e => e.billofentry_id == id) > 0;
        }

        public billofentry getRecord(int id)
        {
            billofentry billofentry = db.billofentries.Find(id);
            if (billofentry == null)
            {
                return null;
            }
            return billofentry;
        }

        public IEnumerable<billofentry> getTable()
        {
            return db.billofentries;
        }

        public billofentry updateRecord(int id, billofentry billofentry)
        {
            billofentry newBill = billofentry;
            if (id != newBill.billofentry_id)
            {
                return null;
            }

            db.Entry(newBill).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!exists(id))
                {
                    return null;
                }
                else
                {
                    throw;
                }
            }
            return newBill;

        }
    }
}