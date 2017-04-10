/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.CategoryEntity;
import Function.CategoryFunc;
import Function.ProductFunc;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author TungVoDoi
 */
public class categoryServlet extends HttpServlet {

    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "../../web/ImageCar";

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    CategoryFunc cate = new CategoryFunc();
    ProductFunc pro = new ProductFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String catid = request.getParameter("category_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    CategoryEntity cateen = new CategoryEntity();
                    if (pro.countProductByCategory(Integer.parseInt(catid)) == 0) {
                        cate.deleteCategory(Integer.parseInt(catid));
                        url = "/java/admin/ql-category.jsp";
                    } else {
                        out.println("Khong the xoa danh muc nay");
                        out.flush();
                        return;
                    }
                    break;
            }
        } catch (Exception e) {
        }
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String catimage = "";
        String nameCategory = "";
        String command = "";
        int catogory_id = 0;
        String catogory_imagehidden = "";
        String catogory_image = "";

        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk 
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        catimage = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + catimage;
                        File storeFile = new File(filePath);

                        item.write(storeFile);
                    } else if (item.getFieldName().equals("name")) {
                        nameCategory = item.getString();
                    } else if (item.getFieldName().equals("command")) {
                        command = item.getString();
                    } else if (item.getFieldName().equals("catid")) {
                        catogory_id = Integer.parseInt(item.getString());
                    } else if (item.getFieldName().equals("catogery_imagehidden")) {
                        catogory_imagehidden = item.getString();
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }

        String url = "", error = "";
        if (nameCategory.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
            request.setAttribute("error", error);
        }
        HttpSession session = request.getSession();
        try {
            if (error.length() == 0) {
                CategoryEntity c = new CategoryEntity(nameCategory, catimage);
                switch (command) {
                    case "insert":
                        if (cate.getListCategoryByName(nameCategory).size() > 0) {
                            System.out.println("ten k ");
                            out.println("ten k dc trung nhau");
                            out.flush();
                            return;
                        } else {
                            cate.insertCategory(c);
                            request.setAttribute("er", "thanh cong");
                            url = "/java/admin/ql-category.jsp";
                        }
                        break;
                    case "update":
                        if (cate.getListCategoryByName(nameCategory).size() > 0) {
                            System.out.println("ten k ");
                            out.println("ten k dc trung nhau");
                            out.flush();
                            return;
                        } else {
                            cate.updateCategory(nameCategory, catimage, catogory_id);
                            url = "/java/admin/ql-category.jsp";
                        }
                        break;
                }
            } else {
                url = "/java/admin/add-category.jsp";
            }
        } catch (Exception e) {

        }
        response.sendRedirect(url);
    }

}
