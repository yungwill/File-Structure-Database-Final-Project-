<html>
<body>
    
    <center>
        <!-- Start of PHP block -->
        <?php 
        
                $dbHost = 'mariadb';
                $dbUsername = 'cs332a8';
                $dbPassword = 'ohkusash';
        
                // Connection with MySQL Relational DBMS
                $mysql_conn = mysql_connect($dbHost, $dbUsername, $dbPassword);
        
                // if unsuccessful connecting to MySQL Relational DBMS
                if (! $mysql_conn ) {
                        die('Unable to connect to host MariaDB' . mysql_error());
                }
        
                // if successful
                $db_selection = mysql_select_db($dbUsername, $mysql_conn);
        
                echo 'Connection with database was successful', "<br>";
        
                echo "<br>";
        
                $search = "SELECT Grade, COUNT(*) as 'NumStudents'
                            FROM Enrollment_Records, Section, Course
                            WHERE Sec_C_Num = C_num 
                            AND C_Number = Sec_C_Num
                            AND Sec_Number = Sec_num
                            AND C_Num = ". $_POST["p_courseNum"]."
                            AND Sec_Number = '".$_POST["p_sectionNum"]."'
                            GROUP BY Grade;";
                
                $result = mysql_query($search, $mysql_conn) or die(mysql_error());
                
                $index = 0;
    
                if ($index < mysql_numrows($result))  {
                    
                    echo "Course Number: " .$_POST["p_courseNum"], "<br>";
                    echo "Section Number: " .$_POST["p_sectionNum"], "<br>";
    
                    for($index = 0; $index < mysql_numrows($result); $index++) {
                    
                        echo mysql_result($result, $index, Grade), ": ", 
                            mysql_result($result, $index, 'NumStudents'), "<br>";
                        
                    }

                }
                else {
                    echo "Invalid Course Number and/or Section Number", "<br>";
                    echo "Please try again", "<br>";
                }

                // Closes connection to MySQL database server
                mysql_close($mysql_conn);
        
        ?> <!-- End of PHP block -->
    </center>
</body>
</html>

