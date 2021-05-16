<html>
    <head>
        <?php
        session_start();
        error_reporting(0);
        include_once("index.php");
        echo "<link rel='stylesheet' type='text/css' href='style.css'>
        <script src='http://code.jquery.com/jquery-2.0.2.min.js'></script>
        <script src='ckeditor/ckeditor.js'></script>";
        require_once('connect.php');

        //удаление статей
        if (isset($_POST['DelArticle'])){
            $id = $_POST['numberDel'];
            mysqli_query($link," DELETE FROM `articles` WHERE `articles`.`id` = $id");
            
            header('Location: index.php');
            echo " <meta http-equiv='refresh' content='0'>";
            exit();
            }

        if ((isset($_POST['Close']))||(isset($_POST['CloseDel']))){
            
            header('Location: index.php');
            echo " <meta http-equiv='refresh' content='0'>";
            exit();
        }
        //обновление статей
        if (isset($_POST['ChangeArticle'])){
            require_once('connect.php');
            $id = $_POST['number'];
            $title = $_POST['titleArtch'];
            $section_id = $_POST['sectionArtch'];
            $text = $_POST['textArtch'];
            $query = mysqli_query($link,"SELECT off_name FROM sections WHERE `id` = $section_id");
            $data = mysqli_fetch_assoc($query);
            $section = $data["off_name"];
            mysqli_query($link,"UPDATE `articles` SET title = '$title', section='$section', text='$text' WHERE `articles`.`id` = $id");
            header('Location: index.php');
            echo " <meta http-equiv='refresh' content='0'>";
            exit();
        }
        
        ?>
    </head>

    <body>
    <?php        
       require_once('connect.php');
        $data = mysqli_query($link, "SELECT id, title FROM articles");  
        while ($row = mysqli_fetch_assoc($data)) {
            $id = $row['id'];
            $name = "change$id"; 
            $GLOBALS['current_art']=$id;
            //изменение статей
            if (isset($_POST[$name])){
                //<!-- поп-ап для редактирования статьи -->
                echo "<form method='post' action='dynamic.php'>";
                echo "<div class='popup' id='art_edit'>
                <div class='popeditArt'>";
                require_once('connect.php');
                $id = $GLOBALS['current_art'];
                $query = mysqli_query($link, "SELECT title, text, date, section FROM articles WHERE id = $id");
                $locdata = mysqli_fetch_assoc($query);
                $title = $locdata['title'];
                $section = $locdata['section'];
                $text = $locdata['text'];
                echo "<input type='hidden' name='number' value='$id'>
                <center><p class='info'>Редактирование статьи</p></center>
                <input type='text' name='titleArtch' width='50px' placeholder='Тема статьи' value='$title'>
                <select name='sectionArtch'>";
                //селектор разделов статей
                $locquery = mysqli_query($link, "SELECT off_name, id FROM sections WHERE id>1");  
                    while ($row = mysqli_fetch_assoc($locquery)) {
                        $locid = $row['id'];
                        $off_name=$row['off_name'];
                        echo "<option value='$locid'";
                        if ($off_name==$section) {
                            echo "selected='selected'";
                        }  
                        echo ">$off_name</option>";
                    }
                    echo "    
                        </select>
                        <textarea name='textArtch' id='editorch'  cols='45' rows='1'>$text</textarea>
                        <script type='text/javascript'>
                            CKEDITOR.replace( 'editorch');     
                        </script> 
                        <div class = 'but'>
                            <center>
                                <input type='submit' name='Close' value='Закрыть окно'>
                            </center>
                            <center>
                                <input type='submit' name='ChangeArticle' value='Изменить статью'>
                            </center>
                        
                        </div>
                    </div>
                </div>";

                echo "</form>";                
            }

            $id = $row['id'];
            $name = "del$id"; 
           
            if (isset($_POST[$name])){
                //<!-- поп-ап для удаления статьи -->
                echo "<form method='post' action='dynamic.php'>";
                echo "<div class='popup' id='art_del'>
                <div class='popdelArt'>";
                require_once('connect.php');
                $id = $GLOBALS['current_art'];
                $query = mysqli_query($link, "SELECT title FROM articles WHERE id = $id");
                $locdata = mysqli_fetch_assoc($query);
                $tit = $locdata['title'];
                echo "<input type='hidden' name='numberDel' value='$id'>
                <center><p class='info'>Вы уверены что хотите удалить статью '<b>$tit</b>'?</p></center>
                        <div class = 'but'>
                            <center>
                                <input type='submit' name='CloseDel' value='Нет, оставить статью'>
                            </center>
                            <center>
                                <input type='submit' name='DelArticle' value='Да, удалить статью'>
                            </center>
                        
                        </div>
                    </div>
                </div>";

                echo "</form>";            


            }

        }



    ?>
    </body>
</html>

