using DentistAppointmentManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace DentistAppointmentManager.Controllers
{
    public class HomeController : Controller
    {
        private DentistContext dentistContext;
        public HomeController()
        {
            this.dentistContext = new DentistContext();
        }
        public ActionResult Index(bool? valid)
        {
            if (valid == null)
            {
                ViewBag.valid = true;
            }
            else
            {
                ViewBag.valid = valid;
            }
            return View();
        }

        public ActionResult validate(FormCollection collection)
        {
            string username = Convert.ToString(collection["username"]);
            string userPassword = Convert.ToString(collection["password"]);

            string password = dentistContext.Database.SqlQuery<String>("Exec returnPassword @userName = '" + username + "'").SingleOrDefault();
            
            if (userPassword.Equals(password))
            {
                FormsAuthentication.SetAuthCookie(username, false);
                return RedirectToAction("Desktop");
            }
            else
            {
                return RedirectToAction("Index", new { valid = false });
            }
        }

        [Authorize(Roles = "Dentist, Admin")]
        public ActionResult Desktop()
        {
            if (User.IsInRole("Dentist"))
            {
                ViewBag.Role = "Dentist";
            }
            else
            {
                ViewBag.Role = "Admin";
            }
            ViewData["userName"] = User.Identity.Name;
            return View();
        }

        [Authorize(Roles = "Dentist, Admin")]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }

    }
}