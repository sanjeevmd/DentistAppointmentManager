using DentistAppointmentManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DentistAppointmentManager.Controllers
{
    public class AppointmentController : Controller
    {
        private DentistContext dentistContext;
        public AppointmentController()
        {
            dentistContext = new DentistContext();
        }

        [Authorize(Roles = "Admin")]
        // GET: Appointment
        public ActionResult AppointmentSearch(string patientSearch)
        {
            if (patientSearch != null)
            {
                var patient = dentistContext.Patients.Where(x => x.firstName.StartsWith(patientSearch)).ToList();
                return View(patient);
            }
            else
            {
                return View(dentistContext.Patients.ToList().OrderBy(s => s.patientHRN));
            }
        }

        public ActionResult UpdateAppointment(string appID)
        {
            int appointmentID = Convert.ToInt32(appID);
            using (var db = new DentistContext())
            {
                var result = db.Appointments.FirstOrDefault(b => b.appointmentID == appointmentID);
                if (result != null)
                {
                    result.updateType = "2";
                    db.SaveChanges();
                }
            }

            return RedirectToAction("OpenAppointment", "Appointment");
        }

        public ActionResult CreateAppointment(FormCollection collection)
        {
            var patientID = collection["Patient"];
            TempData["patientID"] = patientID;
            TempData.Keep("patientID");
            ViewData["DentistDropDown"] = new SelectList(dentistContext.Dentists.ToList(), "dentistID", "firstName");
            ViewData["LocationDropDown"] = new SelectList(dentistContext.Locations.Where(x => x.locationType.Equals("RO")).ToList(), "locationID", "name");
            return View();
        }

        public ActionResult BookingAppointment(FormCollection collection)
        {
            int dentistID = Convert.ToInt32(collection["Dentist"]);
            int locationID = Convert.ToInt32(collection["Location"]);
            DateTime Startdate = Convert.ToDateTime(collection["Date"]);
            DateTime Enddate = Convert.ToDateTime(collection["Date"]);
            var StartTime = collection["StartTime"];
            var EndTime = collection["EndTime"];
            int StartHour = Convert.ToInt32(StartTime.Substring(0, 2));
            int EndHour = Convert.ToInt32(EndTime.Substring(0, 2));
            int StartMinute = Convert.ToInt32(StartTime.Substring(3, 2));
            int EndMinute = Convert.ToInt32(EndTime.Substring(3, 2));
            Startdate = Startdate.AddHours(StartHour);
            Enddate = Enddate.AddHours(EndHour);
            Startdate = Startdate.AddMinutes(StartMinute);
            Enddate = Enddate.AddMinutes(EndMinute);
            Appointments app = new Appointments();
            app.startTime = Startdate;
            app.endTime = Enddate;
            app.dentistID = dentistID;
            app.locationID = locationID;
            app.updateType = "1";
            app.patientID = Convert.ToInt32(TempData["patientID"]);
            TempData.Remove("patientID");

            using (var tran = dentistContext.Database.BeginTransaction())
            {
                try
                {
                    dentistContext.Appointments.Add(app);
                    dentistContext.SaveChanges();
                    tran.Commit();
                }
                catch (Exception e)
                {
                    tran.Rollback();
                    return RedirectToAction("Desktop", "Home");
                }
            }

            return View();
        }

        public ActionResult OpenAppointment()
        {
            string userName = User.Identity.Name;
            int dentistId = dentistContext.Users.Where(s => s.userName == userName)
                .Select(s => s.dentistID).FirstOrDefault();
            var app = dentistContext.Appointments.Where(s => s.dentistID == dentistId &&
             s.updateType == "1").ToList();
            foreach (var appointment in app)
            {
                appointment.dentists = dentistContext.Dentists.Where(s => s.dentistID == appointment.dentistID).FirstOrDefault();
                appointment.patients = dentistContext.Patients.Where(s => s.patientID == appointment.patientID).FirstOrDefault();
                appointment.locations = dentistContext.Locations.Where(s => s.locationID == appointment.locationID).FirstOrDefault();
            }
            return View(app);
        }

        public ActionResult deletePatient(string patID)
        {
            int patientID = Convert.ToInt32(patID);
            if (!dentistContext.Appointments.Where(s => s.patientID == patientID).Any())
            {
                try
                {
                    Patients patient = dentistContext.Patients.Find(patientID);
                    dentistContext.Patients.Remove(patient);
                    dentistContext.SaveChanges();
                }
                catch (Exception e)
                {

                }
            }
            return RedirectToAction("Desktop", "Home");
        }
    }
}