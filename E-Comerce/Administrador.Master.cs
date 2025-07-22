using System;
using System.Web;
using System.Web.UI;

namespace E_Comerce
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeaterMenu.DataSource = SiteMap.RootNode.ChildNodes;
                RepeaterMenu.DataBind();

                RepeaterFooter.DataSource = SiteMap.RootNode.ChildNodes;
                RepeaterFooter.DataBind();
            }
        }
    }
}
