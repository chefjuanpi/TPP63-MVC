using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TPP63_MVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult HallOfFame()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public JsonResult GetProgression(int gameSpan, int size, int difficulty)
        {
            Models.Entities db = new Models.Entities();
            var scores = (from s in db.Scores
                          where size == -1 ? true : s.TailleJeu == size &&
                                difficulty == -1 ? true : s.NiveauDifficulte == difficulty
                          orderby s.DateScore descending
                          select s.Score1
                          ).Take(gameSpan);
            return Json(new int[] { 3, 8, 7, 2, 7, 4, 2, 5, 7, 9, 7, 6, 4, 2, 5, 3, 3, 6, 9, 4, 2, 5, 7, 8, 6, 4, 3, 5, 6, 7, 8 }, JsonRequestBehavior.AllowGet);
            return Json(scores, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetTop10Scores(int timeSpan, int size, int difficulty)
        {
            Models.Entities db = new Models.Entities();
            var scores = (from s in db.Scores
                          where size == -1 ? true : s.TailleJeu == size &&
                                difficulty == -1 ? true : s.NiveauDifficulte == difficulty &&
                                DateTime.Today - s.DateScore < TimeSpan.FromDays((double)timeSpan)
                          orderby s.Score1 descending
                          select new
                          {
                              User = s.AspNetUser.UserName,
                              Score = s.Score1
                          });
            return Json(new[] { new { User = "John", Score = 11445 }, new { User = "Peter", Score = 17445 }, new { User = "Bart", Score = 13245 } }, JsonRequestBehavior.AllowGet);
            return Json(scores, JsonRequestBehavior.AllowGet);
        }
    }
}