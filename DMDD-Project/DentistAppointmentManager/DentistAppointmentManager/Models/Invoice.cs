using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DentistAppointmentManager.Models
{
    public class Invoice
    {
        [Key]
        public string firstName { get; set; }
        public List<string> treatments { get; set; }
        public decimal cost { get; set; }
        public int appointmentID { get; set; }
        public decimal DentistCost { get; set; }
        public string dentist { get; set; }
    }
}