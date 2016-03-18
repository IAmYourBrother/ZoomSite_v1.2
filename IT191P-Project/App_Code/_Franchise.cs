using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _Franchise 
    {
        int ID, branchid;
        DateTime licensestart, licenseend;

        public _Franchise(int bi, DateTime ls, DateTime le)
        {
            branchid = bi;
            licensestart = ls;
            licenseend = le;
        }

        public int FranchiseID
        {
            get { return ID; }
            set { ID = value; }
        }

        public int BranchID
        {
            get { return branchid; }
            set { branchid = value; }
        }
        public DateTime LicenseStart
        {
            get { return licensestart; }
            set { licensestart = value; }
        }
        public DateTime LicenseEnd
        {
            get { return licenseend; }
            set { licenseend = value; }
        }

    }
}