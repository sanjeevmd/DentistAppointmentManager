using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DentistAppointmentManager.Models
{
    [Table("Appointments")]
    public class Appointments
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int appointmentID { get; set; }
        public int patientID { get; set; }
        public int dentistID { get; set; }
        public int locationID { get; set; }
        public int? billingID { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime startTime { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime endTime { get; set; }
        public string updateType { get; set; }

        [ForeignKey("patientID")]
        public Patients patients { get; set; }
        [ForeignKey("dentistID")]
        public Dentists dentists { get; set; }
        [ForeignKey("locationID")]
        public Locations locations { get; set; }
    }
}