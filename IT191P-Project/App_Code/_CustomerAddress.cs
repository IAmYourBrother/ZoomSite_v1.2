using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _CustomerAddress
    {
        int cID;
        string address;
        string ctCode;

        public _CustomerAddress(int c, string a, string co)
        {
            cID = c;
            address = a;
            ctCode = co;
        }

        public int custID
        {
            get { return cID; }
            set { cID = value; }
        }

        public string addr
        {
            get { return address; }
            set { address = value; }
        }

        public string cityCode
        {
            get { return ctCode; }
            set { ctCode = value; }
        }
    }
}