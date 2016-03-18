using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace IT191P_Project.App_Code
{
    public class _ReqFranchise
    {
        int custname;
        string branchLoc;
        string codecity;
        int numYears;

        public _ReqFranchise(int n, string l, string c, int y)
        {
            custname = n;
            branchLoc = l;
            codecity = c;
            numYears = y;

        }



        public int franchisee
        {
            get { return custname; }
            set { custname = value; }
        }
        public string location
        {
            get { return branchLoc; }
            set { branchLoc = value; }
        }
        public string citycode
        {
            get { return codecity; }
            set { codecity = value; }
        }

        public int years
        {
            get { return numYears; }
            set { numYears = value; }
        }
    }
}