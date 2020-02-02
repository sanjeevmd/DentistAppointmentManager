using DentistAppointmentManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DentistAppointmentManager.Controllers
{
    public class BillingController : Controller
    {
        private DentistContext dentistContext;
        public BillingController()
        {
            dentistContext = new DentistContext();
        }
        // GET: Billing
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Billing()
        {
            var app = dentistContext.Appointments.Where(s => s.updateType == "2" && s.billingID == null).ToList();
            foreach (var appointment in app)
            {
                appointment.dentists = dentistContext.Dentists.Where(s => s.dentistID == appointment.dentistID).FirstOrDefault();
                appointment.patients = dentistContext.Patients.Where(s => s.patientID == appointment.patientID).FirstOrDefault();
                appointment.locations = dentistContext.Locations.Where(s => s.locationID == appointment.locationID).FirstOrDefault();
            }
            return View(app);
        }

        public ActionResult generateBill(FormCollection collection)
        {

            var actions = collection.GetValues("Patient");
            List<int> selectedAppointments = new List<int>();
            foreach (string val in actions)
            {
                if (!(val.Contains("true") || val.Contains("false")))
                {
                    selectedAppointments.Add(Convert.ToInt32(val));
                }
            }
            Billing bill = new Billing();

            bill.comments = "";
            bill.billTime = DateTime.Now;
            dentistContext.billing.Add(bill);
            dentistContext.SaveChanges();   

            int billID = dentistContext.billing.OrderByDescending(s => s.billingID).Select(x => x.billingID).FirstOrDefault();
            using (var db = new DentistContext())
            {
                foreach (int i in selectedAppointments)
                {
                    var result = db.Appointments.FirstOrDefault(b => b.appointmentID == i);
                    if (result != null)
                    {
                        result.billingID = billID;
                        db.SaveChanges();
                    }
                }
            }

            List<Invoice> invoice = dentistContext.Database.SqlQuery<Invoice>("Exec Billing @billingID = " + billID).ToList();

            foreach (Invoice inv in invoice)
            {
                List<PatientTreatment> patTreat = dentistContext.patientTreatment.Where(s => s.appointmentID == inv.appointmentID).ToList();

                List<String> treat = new List<String>();

                foreach (PatientTreatment pat in patTreat)
                {
                    treat.Add(dentistContext.treatment.Where(s => s.treatmentID == pat.treatmentID).Select(x => x.name).FirstOrDefault());
                }
                inv.treatments = treat;

                int dentID = dentistContext.Appointments.Where(s => s.appointmentID == inv.appointmentID).Select(x => x.dentistID).FirstOrDefault();
                inv.dentist = dentistContext.Dentists.Where(s => s.dentistID == dentID).Select(s => s.firstName).FirstOrDefault();
            }

            return View(invoice);
        }
    }
}