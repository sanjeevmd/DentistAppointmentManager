using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DentistAppointmentManager.Models
{
    [Table("PatientTreatment")]
    public class PatientTreatment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int patientTreatmentID { get; set; }
        public int appointmentID { get; set; }
        public int treatmentID { get; set; }
        public int? patienttoothID { get; set; }
    }
}