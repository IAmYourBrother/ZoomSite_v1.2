using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _MoneyTransaction
    {
        string transactionid, destCity, receivername;
        double charge;
        int amount;

        public _MoneyTransaction(string ti, int a, string dc, string rn, double ch)
        {
            transactionid = ti;
            amount = a;
            destCity = dc;
            receivername = rn;
            charge = ch;
        }

        public string TransactionID
        {
            get { return transactionid; }
            set { transactionid = value; }
        }

        public int Amount  
        {
            get { return amount; }
            set { amount = value; }
        }

        public string Destination
        {
            get { return destCity; }
            set { destCity = value; }
        }

        public string ReceiverName
        {
            get { return receivername; }
            set { receivername = value; }
        }

        public double Charge
        {
            get { return charge; }
            set { charge = value; }
        }
    }
}