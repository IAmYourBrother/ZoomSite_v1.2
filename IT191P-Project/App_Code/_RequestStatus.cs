using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _RequestStatus
    {

        int id;
        int franchID;
        string loc;
        string ctCode;
        int yrs;
        bool st;

        public _RequestStatus()
        {

        }
        public _RequestStatus(int i, int f, string l, string c, int y, bool s)
        {
            id = i;
            franchID = f;
            loc = l;
            ctCode = c;
            yrs = y;
            st = s;

        }


        public int reqID
        {
            get { return id; }
            set { id = value; }
        }

        public int userid
        {
            get { return franchID; }
            set { franchID = value; }
        }

        public string location
        {
            get { return loc; }
            set { loc = value; }
        }

        public string cityCode
        {
            get { return ctCode; }
            set { ctCode = value; }
        }


        public int years
        {
            get { return yrs; }
            set { yrs = value; }
        }

        public bool stat
        {
            get { return st; }
            set { st = value; }
        }
    }
}