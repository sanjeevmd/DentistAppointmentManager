using DentistAppointmentManager.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DentistAppointmentManager.Controllers
{
    public class DentistController : Controller
    {
        private DentistContext dentistContext;
        public DentistController()
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
        public ActionResult DentistRegistration()
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult DentistRegistration([Bind(Exclude = "dentistID")] FormCollection collection)
        {
            using (var tran = dentistContext.Database.BeginTransaction())
            {
                try
                {
                    string firstName = Convert.ToString(collection["firstName"]);
                    string middleName = Convert.ToString(collection["middleName"]);
                    string lastName = Convert.ToString(collection["lastName"]);
                    string contactNumber = Convert.ToString(collection["contactNumber"]);
                    string gender = Convert.ToString(collection["gender"]);
                    string emailID = Convert.ToString(collection["emailID"]);
                    string aptNumber = Convert.ToString(collection["aptNumber"]);
                    string street = Convert.ToString(collection["street"]);
                    string city = Convert.ToString(collection["city"]);
                    string state = Convert.ToString(collection["state"]);
                    DateTime doj = Convert.ToDateTime(collection["doj"]);
                    string userName = Convert.ToString(collection["userName"]);
                    string password = Convert.ToString(collection["password"]);
                    string zipcode = Convert.ToString(collection["zipcode"]);
                    string role = "Dentist";

                    dentistContext.Database.ExecuteSqlCommand("Exec sp_dentistreg " + "'DM002', '" + firstName + "', '"
                        + lastName + "', '" + middleName + "', '" + contactNumber + "', '" + emailID
                        + "', '" + gender + "', '" + doj + "', '" + aptNumber + "', '" + street + "', '" +
                        city + "', '" + state + "', '" + userName + "', '" + password + "', '" + role + "', '" + zipcode + "'");

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
        public ActionResult CompleteApp(FormCollection collection)
        {
            int appID = Convert.ToInt32(collection["Patient"]);
            TempData["appID"] = appID;
            TempData.Keep("appID");
            int patientID = dentistContext.Appointments.Where(x => x.appointmentID == appID).Select(x => x.patientID).FirstOrDefault();
            ViewData["TreatmentDropDown"] = new SelectList(dentistContext.treatment.ToList(), "treatmentID", "name");
            ViewData["ToothtDropDown"] = new SelectList(dentistContext.ViewPatientTeeth.Where(s => s.patientID == patientID).ToList(), "patienttoothID", "name");
            return View();
        }

        public ActionResult CompletedApp(FormCollection collection)
        {
            int treatmentID = Convert.ToInt32(collection["Treatment"]);
            int appID = Convert.ToInt32(TempData["appID"]);
            TempData.Remove("appID");
            PatientTreatment patTreatment = new PatientTreatment();
            try
            {
                int toothID = Convert.ToInt32(collection["Tooth"]);
                patTreatment.patienttoothID = toothID;
            }
            catch (Exception e)
            {

            }           
            patTreatment.appointmentID = appID;
            patTreatment.treatmentID = treatmentID;
            dentistContext.patientTreatment.Add(patTreatment);
            dentistContext.SaveChanges();
            return View();
        }
    }
}