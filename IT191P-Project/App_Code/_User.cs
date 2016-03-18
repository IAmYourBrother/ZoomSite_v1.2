using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _User
    {
        int ID;
        string lname, fname, mname, mobileno, email, username, password, type;
        char sex;

        public _User(string l, string f, string m, string mn, string e, string u, string p, string t, char s)
        {
            lname = l;
            fname = f;
            mname = m;
            mobileno = mn;
            email = e;
            username = u;
            password = p;
            type = t;
            sex = s;
        }

        public string Lname
        {
            get { return lname; }
            set { lname = value; }
        }

        public string Fname
        {
            get { return fname; }
            set { fname = value; }
        }

        public string Mname
        {
            get { return mname; }
            set { mname = value; }
        }

        public string MobileNo
        {
            get { return mobileno; }
            set { mobileno = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Type
        {
            get { return type; }
            set { type = value; }
        }


        public char Sex
        {
            get { return sex; }
            set { sex = value; }
        }

        public int UserID
        {
            get { return ID; }
            set { ID = value; }
        }
    }
}