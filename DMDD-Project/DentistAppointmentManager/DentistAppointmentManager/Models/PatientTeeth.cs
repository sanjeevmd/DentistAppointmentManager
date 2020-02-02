using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DentistAppointmentManager.Models
{
    public class PatientTeeth
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int patienttoothID { get; set; }
        public int patientID { get; set; }
        public int toothID { get; set; }
        public DateTime updateDate { get; set; }
    }
}