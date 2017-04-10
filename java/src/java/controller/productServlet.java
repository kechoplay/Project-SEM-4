/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.CategoryEntity;
import Entity.ProductEntity;
import Function.CategoryFunc;
import Function.FeedbackFunc;
import Function.ProductFunc;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author TungVoDoi
 */
public class productServlet extends HttpServlet {

    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "../../web/ImageCar";

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    ProductFunc prod = new ProductFunc();
    FeedbackFunc fedd=new FeedbackFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String proid = request.getParameter("product_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    if (prod.countProductByBill(Integer.parseInt(proid)) > 0) {
                        out.println("Ban k the xoa san pham nay");
                        out.flush();
                        return;
                    } else {
                        fedd.deleteFeedbackByProduct(Integer.parseInt(proid));
                        prod.deleteProduct(Integer.parseInt(proid));
                        url = "/java/admin/ql-product.jsp";
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String proimage = "";
        String nameProduct = "";
        double priceProduct = 0;
        String desProduct = "";
        String colorProduct = "";
        int years = 0;
        int catId = 0;
        int proid = 0;
        String command = "";

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
                        proimage = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + proimage;
                        File storeFile = new File(filePath);
                        System.out.println(proimage);
                        item.write(storeFile);
                    } else if (item.getFieldName().equals("name")) {
                        nameProduct = item.getString();
                    } else if (item.getFieldName().equals("price")) {
                        priceProduct = Double.parseDouble(item.getString());
                    } else if (item.getFieldName().equals("description")) {
                        desProduct = item.getString();
                        System.out.println(desProduct);
                    } else if (item.getFieldName().equals("color")) {
                        colorProduct = item.getString();
                    } else if (item.getFieldName().equals("years")) {
                        years = Integer.parseInt(item.getString());
                    } else if (item.getFieldName().equals("catogory_name")) {
                        catId = Integer.parseInt(item.getString());
                    } else if (item.getFieldName().equals("command")) {
                        command = item.getString();
                    } else if (item.getFieldName().equals("proid")) {
                        proid = Integer.parseInt(item.getString());
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }

        String url = "", error = "";
        if (nameProduct.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                ProductEntity p = new ProductEntity(catId, nameProduct, priceProduct, proimage, desProduct, colorProduct, years);
                switch (command) {
                    case "insert":
                        prod.insertProduct(p);
                        url = "/java/admin/ql-product.jsp";
                        break;
                    case "update":
                        prod.updateProduct(catId, nameProduct, priceProduct, proimage, desProduct, colorProduct, years, proid);
                        url = "/java/admin/ql-product.jsp";
                        break;
                }
            } else {
                url = "/java/admin/add-product.jsp";
            }
        } catch (Exception e) {

        }
        response.sendRedirect(url);
    }

}
