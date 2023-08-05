using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inciso1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUser.Text == "" && txtPwd.Text == "")
            {
                lblMessagePwd.Text = "";
                lblMessageUser.Text = "";
                lblMessage.Text = "🕵️‍♂️ Debe de ingresar usuario y contraseña. 🔐";
            }
            else if (txtPwd.Text == "")
            {
                lblMessage.Text = "";
                lblMessageUser.Text = "";
                lblMessagePwd.Text = "🔐 Debe de ingresar su contraseña.";
                txtUser.Text = "";
            }
            else if (txtUser.Text == "")
            {
                lblMessage.Text = "";
                lblMessagePwd.Text = "";
                lblMessageUser.Text = "🕵️‍♂️ Debe de ingresar su usuario.";
                txtPwd.Text = "";
            }
            else
            {
                lblMessage.Text = "";
                lblMessagePwd.Text = "";
                lblMessageUser.Text = "";
                lblMessage.Text = "🛠️ Sitio en construcción.";
                txtUser.Text = "";
                txtPwd.Text = "";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblMessagePwd.Text = "";
            lblMessageUser.Text = "";
            lblMessage.Text = "🛠️ Funcionalidad aun no disponible.";
            txtUser.Text = "";
            txtPwd.Text = "";
        }
    }
}