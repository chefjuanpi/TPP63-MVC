using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TPP63_MVC.Startup))]
namespace TPP63_MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
