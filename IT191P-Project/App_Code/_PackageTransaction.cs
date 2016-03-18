using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _PackageTransaction
    {
        decimal weight, amount;
        string src, dest, transactionid, desc, city;

        public _PackageTransaction(string transactionid, decimal weight, decimal amount, string src, string dest, string desc, string city)
        {
            this.transactionid = transactionid;
            this.weight = weight;
            this.amount = amount;
            this.src = src;
            this.dest = dest;
            this.desc = desc;
            this.city = city;
        }

        public string PackageTransactionID
        {
            get { return transactionid; }
            set { transactionid = value; }
        }

        public decimal Weight
        {
            get { return weight; }
            set { weight = value; }
        }

        public decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public string SourceAddr
        {
            get { return src; }
            set { src = value; }
        }

        public string DestinationAddr
        {
            get { return dest; }
            set { dest = value; }
        }

        public string PackageDesc
        {
            get { return desc; }
            set { desc = value; }
        }

        public string City
        {
            get { return city; }
            set { city = value; }
        }
    }
}