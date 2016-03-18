using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT191P_Project.App_Code
{
    public class _Computations
    {
        string packageType;

        public _Computations()
        {

        }

        public double Compute(double weight)
        {
            double amount = 0;

            if (weight > 1 && weight < 10)
                packageType = "Extra Small";

            else if (weight >= 10 && weight < 25)
                packageType = "Small";

            else if (weight >= 25 && weight < 50)
                packageType = "Medium";

            else if (weight >= 50 && weight < 75)
                packageType = "Large";

            else
                packageType = "Other";

            switch(packageType)
            {   
                case "Extra Small":
                    amount = ((weight * 20 + 150)) + (((weight * 20 + 150)) * .12);
                    break;

                case "Small":
                    amount = ((weight * 20 + 250)) + (((weight * 20 + 250)) * .12);
                    break;

                case "Medium":
                    amount = ((weight * 20 + 500)) + (((weight * 20 + 500)) * .12);
                    break;

                case "Large":
                    amount = ((weight * 20 + 750)) + (((weight * 20 + 750)) * .12);
                    break;

                case "Other":
                    amount = ((weight * 20 + 900)) + (((weight * 20 + 900)) * .12);
                    break;
            }
            return amount;
        }
    }
}