using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DentistAppointmentManager.Models
{
    [Table("Dentist")]
    public class Dentists
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int dentistID { get; set; }
        public string dentistHRN { get; set; }
        public string firstName { get; set; }
        public string middleName { get; set; }
        public string lastName { get; set; }
        public string contactNumber { get; set; }
        public string mailID { get; set; }
        public string gender { get; set; }
        public DateTime? DOJ { get; set; }
        public string aptNumber { get; set; }
        public string street { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zipcode { get; set; }
    }
}