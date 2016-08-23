using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
    public Helper()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string GetCon()
    {
        return ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    }

    public static string CreateSHAHash(string Phrase)
    {
        SHA512Managed HashTool = new SHA512Managed();
        Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
        Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
        HashTool.Clear();
        return Convert.ToBase64String(EncryptedBytes);
    }

    public static void SendEmail(string email, string subject, string message)
    {
        MailMessage emailMessage = new MailMessage();
        emailMessage.From = new MailAddress("<gmail email address>", "Administrator");
        emailMessage.To.Add(new MailAddress(email));
        emailMessage.Subject = subject;
        emailMessage.Body = message;
        emailMessage.IsBodyHtml = true;
        emailMessage.Priority = MailPriority.Normal;
        SmtpClient MailClient = new SmtpClient("smtp.gmail.com", 587);
        MailClient.EnableSsl = true;
        MailClient.Credentials = new System.Net.NetworkCredential("<gmail email address>", "<your password>");
    }
    public static string CountData(string table, string field, string arg)
    {
        SqlConnection con = new SqlConnection(GetCon());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        if (arg == "")
        {
            com.CommandText = "SELECT COUNT (*) FROM " + table;
        }
        else
        {
            com.CommandText = "SELECT COUNT (*) FROM " + table +
                " WHERE " + field + "=@Arg";
            com.Parameters.AddWithValue("@Arg", arg);
        }
        int total = (int)com.ExecuteScalar();
        con.Close();
        return total.ToString();

    }
}