using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _Transaction
    {
        string transactionId, trackingNo, destination, type, status, source, city;
        string custID;
        decimal payment;

        public _Transaction(string transactionId, string trackingNo, string custID, string source, string destination, string status, string type, decimal payment, string city)
        {
            this.transactionId = transactionId;
            this.trackingNo = trackingNo;
            this.custID = custID;
            this.source = source;
            this.destination = destination;
            this.status = status;
            this.type = type;
            this.payment = payment;
            this.city = city;
        }

        public string TransactionId
        {
            get { return transactionId; }
            set { transactionId = value; }
        }

        public string TrackingNo
        {
            get { return trackingNo; }
            set { trackingNo = value; }
        }

        public string CustomerId
        {
            get { return custID; }
            set { custID = value; }
        }

        public string Source
        {
            get { return source; }
            set { source = value; }
        }

        public string Destination
        {
            get { return destination; }
            set { destination = value; }
        }

        public string Status
        {
            get { return status; }
            set { status = value; }
        }

        public string Type
        {
            get { return type; }
            set { type = value; }
        }

        public string City
        {
            get { return city; }
            set { city = value; }
        }

        public decimal Amount
        {
            get { return payment; }
            set { payment = value; }
        }
    }
}