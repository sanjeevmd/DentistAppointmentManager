using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DentistAppointmentManager.Models
{
    
    public class ViewPatientTeeth
    {
        [Key]
        public string name { get; set; }
        public int patienttoothID { get; set; }
        public int patientID { get; set; }
    }
}