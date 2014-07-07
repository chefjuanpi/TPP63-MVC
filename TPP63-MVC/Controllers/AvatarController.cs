using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using TPP63_MVC.Models;

namespace TPP63_MVC.Controllers
{
    public class AvatarController : Controller
    {
        // GET: Avatar
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetAvatars()
        {
            Models.Entities db = new Models.Entities();
            var avatars = (from a in db.Avatars
                           select new
                           {
                               IdAvatar = a.IDAvatar,
                               Nom = a.Nom
                           });
            return Json(avatars, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetImg(int IDAvatar)
        {
            Models.Entities db = new Models.Entities();

            var imagen = from i in db.Avatars
                         where i.IDAvatar == IDAvatar
                         select new
                         {
                             Source = i.Source,
                             Id = i.IDAvatar,
                             description = i.Description
                         };
            return Json(imagen, JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetImg2(string IDuser)
        {
            Models.Entities db = new Models.Entities();

            var imagen = from i in db.AspNetUsers
                         where i.Id == IDuser
                         select new
                         {
                             Source = i.Avatar.Source,
                             Id = i.Avatar.IDAvatar,
                             description = i.Avatar.Description
                         };
            return Json(imagen, JsonRequestBehavior.AllowGet);
        }

        [AllowAnonymous]
        public ActionResult Changer()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Changer(changerViewModel model)
        {
            var guid = model.id;
            int avg = model.Avatar;

            Entities db = new Entities();
            AspNetUser u = db.AspNetUsers.Single(us => us.Id == guid);
            u.IdAvatar = avg;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                // Provide for exceptions.
            }
            return RedirectToAction("Manage", "Account");
        }

    }
}