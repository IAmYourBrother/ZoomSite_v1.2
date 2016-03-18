using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _Branch
    {
        int branchownerid, branchmanagerid;
        string location;
        string brID;
        string ctCode;
        public _Branch(string l, int boi, string bid, string ctc)
        {
            location = l;
            branchownerid = boi;
            brID = bid;
            ctCode = ctc;
        }

        public _Branch(int bmi)
        {
            branchmanagerid = bmi;
        }

        public string Location
        {
            get { return location; }
            set { location = value; }
        }

        public int BranchOwnerID
        {
            get { return branchownerid; }
            set { branchownerid = value; }
        }

        public int BranchManagerID
        {
            get { return branchmanagerid; }
            set { branchmanagerid = value; }
        }

        public string BranchId
        {
            get { return brID; }
            set { brID = value; }
        }

        public string cityCode
        {
            get { return ctCode; }
            set { ctCode = value; }
        }
    }
}