using System.IO;
using System.Web;
using System.Web.Mvc;
using lyncor.Models;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System;

namespace lyncor.Controllers
{
    public class fileController : baseController
    {
        #region "Private Methods"
        private string excelConnectionString;
        private string GetExcelColumnName(int columnNumber)
        {
            int dividend = columnNumber;
            string columnName = String.Empty;
            int modulo;

            while (dividend > 0)
            {
                modulo = (dividend - 1) % 26;
                columnName = Convert.ToChar(65 + modulo).ToString() + columnName;
                dividend = (int)((dividend - modulo) / 26);
            }

            return columnName;
        }

        private void mirgrateDataExcelToSQLServerByColumnRange(string fileName, int rowStart, string destination, string colStart, string colEnd, string virtualColumns)
        {
            OleDbCommand command = default(OleDbCommand);
            OleDbDataReader rdr = default(OleDbDataReader);
            OleDbConnection conn = default(OleDbConnection);
            try
            {
                conn = new OleDbConnection(string.Format(excelConnectionString, fileName));
                conn.Open();
                if (virtualColumns != "") virtualColumns += ",";
                command = conn.CreateCommand();
                command.CommandText = "Select " + virtualColumns + " * From [sheet1$" + colStart + rowStart + ":" + colEnd + "]";
                command.CommandType = CommandType.Text;
                rdr = command.ExecuteReader();
                if (rdr.HasRows )
                {
                    SqlBulkCopy sqlBulk = new SqlBulkCopy(dbConnection.ConnectionString);
                    sqlBulk.DestinationTableName = destination;
                    sqlBulk.WriteToServer(rdr);
                    rdr.Close();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                if(conn.State==ConnectionState.Open) conn.Close();
                throw ex;
            };

        }

        private void MigrateExcelFile(string fileName, int project_specs_id, int noOfsets)
        {
            string virtualColumns = string.Format("0 as id,{0} as project_specs_id,null as user_id", project_specs_id);
            int intColFrom = 1;
            int minColumns = 60;
            for (int x = 1; x <= noOfsets; x++)
            {
                string colFrom = GetExcelColumnName(intColFrom);
                string colTo = GetExcelColumnName(minColumns * x);
                mirgrateDataExcelToSQLServerByColumnRange(fileName, 1, "xls_data_set" + x, colFrom, colTo, virtualColumns);
                intColFrom += minColumns;
            }

        }
        #endregion

        [HttpPost]
        public JsonResult templateUpload(HttpPostedFileBase file, int project_specs_id,int dataset_limit)
        {
            try
            {
                dcAppProfile dc = new dcAppProfile();
                appProfile ap = dc.GetInfo();
                excelConnectionString = ap.excel_conn_str;
                var path = "c:\\temp\\";
                var fullPath = path;
                if (file != null && file.ContentLength > 0)
                {
                    if (Directory.Exists(ap.excel_folder)) path = ap.excel_folder;
                    var fileName = Path.GetFileName(file.FileName);
                    fullPath = Path.Combine(path, fileName);
                    file.SaveAs(fullPath);
                    //delete existing records:
                    dc.Execute(new zsi.DataAccess.Provider.SQLServer.Procedure("xls_data_set_del"));
                    //migrate data:
                    MigrateExcelFile(fullPath, project_specs_id, dataset_limit);
                }
            }
            catch (Exception ex)
            {

                return Json(new { isSuccess = false, errMsg = ex.Message });
            }

            return Json(new { isSuccess = true, msg = "ok" });
        }

        public ActionResult viewImage(string fileName, string isThumbNail = "n")
        {
            appProfile ap = new dcAppProfile().GetInfo();
            var path = "c:\\temp\\";
            var fullPath = path;
            if (Directory.Exists(ap.image_folder)) path = ap.image_folder;
            if (isThumbNail.ToLower() == "y") path = path + "thumbnails\\";
            fullPath = Path.Combine(path, fileName);
            if (!System.IO.File.Exists(fullPath))
                fullPath = "/images/no-image.jpg";

            return base.File(fullPath, "image/jpeg");
        }

        [HttpPost]
        public JsonResult projectImageUpload(HttpPostedFileBase file, HttpPostedFileBase file_thumbnail, int project_id)
        {
            try
            {
                appProfile ap = new dcAppProfile().GetInfo();
                var path = "c:\\temp\\";
                var fullPath = path;
                var fileNameThumbNails = "";
                var fileNameOrg = "";

                if (file_thumbnail != null && file_thumbnail.ContentLength > 0)
                {
                    if (Directory.Exists(ap.image_folder)) path = ap.image_folder;
                    fileNameThumbNails = Path.GetFileName(file_thumbnail.FileName);
                    fullPath = Path.Combine(path + "thumbnails\\", fileNameThumbNails);
                    file_thumbnail.SaveAs(fullPath);

                }

                if (file != null && file.ContentLength > 0)
                {
                    if (Directory.Exists(ap.image_folder)) path = ap.image_folder;
                    fileNameOrg = Path.GetFileName(file.FileName);
                    fullPath = Path.Combine(path, fileNameOrg);
                    file.SaveAs(fullPath);

                }

                DataHelper.toJSON(
                      "dbo.image_file_project_upd @project_id=" + project_id
                    + ",@img_filename_thumbnail='" + fileNameThumbNails + "'"
                    + ",@img_filename_org='" + fileNameOrg + "'"
                    , false);

            }
            catch (Exception ex)
            {

                return Json(new { isSuccess = false, errMsg = ex.Message });
            }

            return Json(new { isSuccess = true, msg = "ok" });
        }


        [HttpPost]
        public JsonResult UploadImage(HttpPostedFileBase file, string prefixKey)
        {
            try
            {
                appProfile ap = new dcAppProfile().GetInfo();
                var path = "c:\\temp\\";
                var fullPath = path;
                var fileNameOrg = "";

                if (file != null && file.ContentLength > 0)
                {
                    if (Directory.Exists(ap.image_folder)) path = ap.image_folder;
                    fileNameOrg = Path.GetFileName(file.FileName);
                    fullPath = Path.Combine(path, prefixKey + fileNameOrg);
                    file.SaveAs(fullPath);

                }


            }
            catch (Exception ex)
            {

                return Json(new { isSuccess = false, errMsg = ex.Message });
            }

            return Json(new { isSuccess = true, msg = "ok" });
        }

        public FileResult loadFile(string fileName)
        {
            appProfile ap = new dcAppProfile().GetInfo();
            var path = "c:\\temp\\";
            if (Directory.Exists(ap.image_folder)) path = ap.image_folder;
            var fullPath = Path.Combine(path, fileName);
            string contentType = MimeMapping.GetMimeMapping(fileName);
            return File(fullPath, contentType);
        }

        public ContentResult checkFile(string fileName)
        {
            appProfile ap = new dcAppProfile().GetInfo();
            var path = "c:\\temp\\";
            if (Directory.Exists(ap.image_folder)) path = ap.image_folder;
            var fullPath = Path.Combine(path, fileName);

            return Content(System.IO.File.Exists(fullPath).ToString(),"text/plain",System.Text.Encoding.UTF8);
        }

    }
}