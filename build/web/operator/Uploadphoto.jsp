<%@page import="java.sql.*" %>
<%@page import="java.io.FileOutputStream" %>
<%@page  import="java.io.File" %>
<%@page import="java.io.DataInputStream" %>
<%  


        String saveFile="";
        String s_id=request.getParameter("s_id");
        String contentType=request.getContentType();
        if((contentType!=null) && (contentType.indexOf("multipart/form-data")>=0))
    {
        DataInputStream in=new DataInputStream(request.getInputStream());
         int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
                totalBytesRead += byteRead;
                }
                String file = new String(dataBytes);
                saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1,contentType.length());
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;


                            saveFile=s_id+"_"+saveFile;
                            File f = new File("D:/Java/FeeSystem/web/operator/photo/"+saveFile);
                FileOutputStream fileOut = new FileOutputStream(f);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();


                //Send page details in table

            Class.forName("com.mysql.jdbc.Driver");
            String path="jdbc:mysql://localhost:3306/fee_system";
            String dbuser="root";
            String dbpass="";
            Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
            String sql="insert into st_photo value (?,?)";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(2,saveFile);
            p1.setInt(1,Integer.parseInt(s_id));
            p1.executeUpdate();
                        }
            %>
            <h2>Photo Uploaded</h2>