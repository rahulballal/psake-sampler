using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PSakeSampler.Nupkg;
using PSakeSampler.Nupkg2;

namespace PSakeSampler.AspNetWebApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Marvel()
        {
            return View(MarvelHeroes.GetHeroes());
        }

        public ActionResult DC()
        {
            return View(DCHeroes.GetHeroes());
        }
    }
}