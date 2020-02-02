using DentistAppointmentManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DentistAppointmentManager.Controllers
{
    public class PatientController : Controller
    {
        private DentistContext dentistContext;
        public PatientController()
        {
            dentistContext = new DentistContext();
        }
        // GET: Patient
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult PatientRegistration()
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult PatientRegistration([Bind(Exclude = "patientID")] Patients patient)
        {
            using (var tran = dentistContext.Database.BeginTransaction())
            {
                try
                {
                    dentistContext.Patients.Add(patient);
                    dentistContext.SaveChanges();
                    tran.Commit();
                    return RedirectToAction("Desktop", "Home");
                }
                catch (Exception e)
                {
                    tran.Rollback();
                    return View();
                }
            }
        }
    }
}