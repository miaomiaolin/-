using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
///DBHelper 的摘要说明
/// </summary>
public class DBHelper
{
	public DBHelper()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 获取数据库连接
    /// </summary>
    /// <returns></returns>
    public static SqlConnection getConnection()
    {
        string connStr = ConfigurationManager.ConnectionStrings["connStr2"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        return conn;
    }
    /// <summary>
    /// 根据select语句查询，获得DataSet结果集
    /// </summary>
    /// <param name="sql">select语句</param>
    /// <returns></returns>
    public static DataSet getDataSet(string sql)
    {
        //1:获取数据库的连接
        SqlConnection conn =  DBHelper.getConnection();
        //2:查询数据
        SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        return ds;
    }
    /// <summary>
    /// 执行非查询，返回受影响的行数
    /// </summary>
    /// <param name="sql">insert,update,delete语句</param>
    /// <returns></returns>
    public static int exeDML(string sql)
    {
        SqlConnection conn = getConnection();
            try
            {
             SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            return i;   
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
    }

}


