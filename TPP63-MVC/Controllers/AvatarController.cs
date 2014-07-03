using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
            Models.AcroClusterEntities db = new Models.AcroClusterEntities();
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
            Models.AcroClusterEntities db = new Models.AcroClusterEntities();

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

    }
}