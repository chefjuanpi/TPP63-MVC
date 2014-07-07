using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TPP63_MVC.Models;

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
                          where (size == -1 ? true : s.TailleJeu == size) &&
                                (difficulty == -1 ? true : s.NiveauDifficulte == difficulty)
                          orderby s.DateScore
                          select s.Score1
                          ).Take(gameSpan);
            return Json(scores, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetTop5Scores(int timeSpan, int size, int difficulty)
        {
            Models.Entities db = new Models.Entities();
            var scores = (from s in db.Scores
                          where (size == -1 ? true : s.TailleJeu == size) &&
                                (difficulty == -1 ? true : s.NiveauDifficulte == difficulty)// &&
                                //(DbFunctions.DiffSeconds(DateTime.Now, s.DateScore) < timeSpan * 24 * 60 * 60)
                          orderby s.Score1 descending
                          select new
                          {
                              User = s.AspNetUser.UserName,
                              Score = s.Score1
                          }).Take(5);
            return Json(scores, JsonRequestBehavior.AllowGet);
        }

        public JsonResult CreateScore(String username, int size, int difficulty)
        {
            Models.Entities db = new Models.Entities();
            
            Score score = new Score {
                UserID = username,
                Score1 = 0,
                DateScore = DateTime.Now,
                TailleJeu = (byte)size,
                NiveauDifficulte = (byte)difficulty
            };

            db.Scores.Add(score);

            try {
                db.SaveChanges();
                //db.SaveChangesAsync();
            }
            catch (Exception ex) {
                // db. revert changes?
            
                return Json(-1, JsonRequestBehavior.AllowGet);
            }
            
            var scoreID = (from s in db.Scores
                          orderby s.DateScore descending
                          select s.ScoreID
                          ).First();
            
            return Json(scoreID, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateScore(int scoreID, int newScore)
        {
            Models.Entities db = new Models.Entities();
            
            var score = (from s in db.Scores
                         where s.ScoreID == scoreID
                         select s).Single();
                         
            score.Score1 = newScore;

            try
            {
                db.SaveChanges();
                //db.SaveChangesAsync();
            }
            catch (Exception ex) {
                // db. revert changes?
            
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}