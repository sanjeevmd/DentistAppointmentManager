using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace DentistAppointmentManager.Models
{
    public class DentistContext : DbContext
    {
        public DbSet<Users> Users { get; set; }
        public DbSet<Patients> Patients { get; set; }
        public DbSet<Dentists> Dentists { get; set; }
        public DbSet<Locations> Locations { get; set; }
        public DbSet<Appointments> Appointments { get; set; }
        public DbSet<Treatment> treatment { get; set; }
        public DbSet<Teeth> teeth { get; set; }
        public DbSet<PatientTreatment> patientTreatment { get; set; }
        public DbSet<PatientTeeth> patientTeeth { get; set; }
        public DbSet<ViewPatientTeeth> ViewPatientTeeth { get; set; }
        public DbSet<Billing> billing { get; set; }

        public System.Data.Entity.DbSet<DentistAppointmentManager.Models.Invoice> Invoices { get; set; }
    }
}