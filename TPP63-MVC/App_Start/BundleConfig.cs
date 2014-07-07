using System.Web;
using System.Web.Optimization;

namespace TPP63_MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jquery-ui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/Game").Include(
                        "~/Scripts/Game/Shortcuts.js",
                        "~/Scripts/Game/block.js",
                        "~/Scripts/Game/game.js"
                        ));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/fotorama.js"));

            bundles.Add(new ScriptBundle("~/bundles/xcharts").Include(
                        "~/Scripts/JS xCharts/d3.v2.min.js",
                        "~/Scripts/JS xCharts/xcharts.min.js"
                        ));

            bundles.Add(new StyleBundle("~/Content/graphcss").Include(
                      "~/Scripts/JS xCharts/xcharts.min.css"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/fonts/font-awesome/css/font-awesome.css",
                      "~/Content/site.css",
                      "~/Content/Game.css",
                      "~/Content/fotorama.css"));

            // Set EnableOptimizations to false for debugging. For more information,
            // visit http://go.microsoft.com/fwlink/?LinkId=301862
            BundleTable.EnableOptimizations = true;
        }
    }
}
