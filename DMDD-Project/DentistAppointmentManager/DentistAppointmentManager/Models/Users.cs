using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DentistAppointmentManager.Models
{
    [Table("userAccount")]
    public class Users
    {
        [Key]
        public int userID { get; set; }
        public string userName { get; set; }
        public string password { get; set; }
        public string role { get; set; }
        public int dentistID { get; set; }

    }
}