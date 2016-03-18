using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _Revenue
    {
        int ID, branchid, transactionid;
        DateTime date;

        public _Revenue(int bi, int ti, DateTime d)
        {
            branchid = bi;
            transactionid = ti;
            date = d;
        }

        public int RevenueID
        {
            get { return ID; }
            set { ID = value; }
        }

        public int TransactionID
        {
            get { return transactionid; }
            set { transactionid = value; }
        }

        public int BranchID
        {
            get { return branchid; }
            set { branchid = value; }
        }

        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
    }
}