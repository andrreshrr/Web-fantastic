<html>
    <head>
        <title>Стек технологий LAMP</title>
        <?php
        session_start();
        error_reporting(0);
        require_once('connect.php');
        // Регистрация
        $GLOBALS['errs_count']=-1;
        $GLOBALS['err']=array();
        if(isset($_POST['registr']))
        {
            $GLOBALS['errs_count']=0;
            $GLOBALS['err']=[];
            // проверка логина на корректность
            if(!preg_match("/^[a-zA-Z0-9]+$/",$_POST['login']))
            {
                $GLOBALS['err'][] = "Логин может состоять только из букв английского алфавита и цифр";
                $GLOBALS['errs_count']++;
            }

            if(strlen($_POST['login']) < 3 or strlen($_POST['login']) > 30)
            {
                $GLOBALS['err'][] = "Логин должен быть не меньше 3-х символов и не больше 30";
                $GLOBALS['errs_count']++;
            }

            // проверка логина на уникальность
            $query = mysqli_query($link, "SELECT id FROM users WHERE login='".mysqli_real_escape_string($link, $_POST['login'])."'");
            if(mysqli_num_rows($query) > 0)
            {
                $GLOBALS['err'][] = "Пользователь с таким логином уже существует в базе данных";
                $GLOBALS['errs_count']++;
            }    
            if($errs_count == 0)
            {
                $login = $_POST['login'];
                $password = md5(md5(trim($_POST['password'])));
                $name = $_POST['name'];
                mysqli_query($link,"INSERT INTO users SET name='".$name."', login='".$login."', password='".$password."'");
                $query = mysqli_query($link, "SELECT id FROM users WHERE login='".$login."'");
                $data = mysqli_fetch_assoc($query);
                $id = $data['id'];
                mysqli_query($link,"INSERT INTO `synhro` (`id_user`, `id_section`) VALUES ('$id', '1');");
            }
        }
        // Авторизация
        $GLOBAL['in_err']=-1;
        if(isset($_POST['loginBD']))
        {   
            $GLOBAL['in_err'] = 0;


            if(strlen($_POST['loginIN']) < 3 or strlen($_POST['loginIN']) > 30)
            {
                $GLOBAL['in_err']++;
            }

            $query = mysqli_query($link, "SELECT id, name, password FROM users WHERE login='".mysqli_real_escape_string($link, $_POST['loginIN'])."'");
            $data = mysqli_fetch_assoc($query);

            if($data['password'] === md5(md5($_POST['passwordIN'])))
            {
                $_SESSION['user']=[
                    "id" => $data["id"],
                    "name" => $data["name"],

                ];
                $id = $data['id'];
                mysqli_query($link," UPDATE `synhro` SET `id_section` = '1' WHERE `synhro`.`id_user` = $id ;");
            
            }
            else
            {
                $GLOBAL['in_err']++;
            }

            
        }
        // Добавление статьи
        if (isset($_POST['AddArticle'])){

            $title=$_POST['titleArt'];
            $section=$_POST['sectionArt'];
            $text = $_POST["textArt"];
            $user_id=$_SESSION['user']['id'];
            $data = mysqli_query($link, "SELECT off_name FROM sections WHERE id='$section'");
            while ($row = mysqli_fetch_assoc($data)) {
                mysqli_query($link,"INSERT INTO articles SET
                title='".$title."', text='".$text."', section='".$row['off_name']."', 
                user_id = '".$user_id."'");
            }
        }

        // Добавление раздела
        if (isset($_POST['SectAdd'])){

            $section=$_POST['sectionname'];
            $text = '<p class="info">Здесь вы можете читать статьи про '.$section.'</p>';
            mysqli_query($link,"INSERT INTO sections SET
                off_name='$section', content='$text'");
        }

        //пользователь хочет сменить раздел
        $data = mysqli_query($link, "SELECT id FROM sections");
        $id_user = $_SESSION['user']['id'];
        while ($row = mysqli_fetch_assoc($data)) {
            $id = $row['id'];
            if (isset($_POST[$id])){
                mysqli_query($link," UPDATE `synhro` SET `id_section` = '$id' WHERE `synhro`.`id_user` = $id_user ;");
            }            
        }
        ?>

        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>

         <script src="ckeditor/ckeditor.js"></script> 

        <!--  скрипт для показа/скрытия поп-апов -->
        <script>
            $(document).ready(function(){
                //Скрыть PopUp при загрузке страницы    
                RegHide();
                LogHide();
                ArtHide();
                PopSectHide();
                
            });

            function LogShow(){
                $("#log").show();
            }
            //Функция скрытия PopUp
            function LogHide(){
                $("#log").hide();
            }
            function PopSectShow(){
                $("#addsect").show();
            }
            //Функция скрытия PopUp
            function PopSectHide(){
                $("#addsect").hide();
            }
            function RegShow(){
                $("#regin").show();
            }
            //Функция скрытия PopUp
            function RegHide(){
                $("#regin").hide();
            }
            function ArtShow(){
               
                $("#art_wr").show();
            }
            function ArtHide(){
                $("#art_wr").hide();
                
            }
            CKEDITOR.config.resize_enabled = false;
        
        </script>

    </head>

    <body>
        <form method="post" action="index.php">
            <table width=100%>
                <td width = 77% >
                    <ul class="menu">   
                        <?php       // шапка с разделами
                        if ($_SESSION['user']){
                            require_once('connect.php');
                            $searchactive = true;
                            $query = mysqli_query($link, "SELECT off_name, id FROM sections");
                            while ($row = mysqli_fetch_assoc($query)) {
                                $id = $row['id'];
                                $off_name=$row['off_name'];
                                
                                echo "<li><input ";
                                if ($searchactive){
                                    $id_us = $_SESSION['user']['id'];
                                     $locquery=mysqli_query($link, "SELECT id_section FROM synhro WHERE id_user = $id_us");
                                     $locrow = mysqli_fetch_assoc($locquery);
                                    $id_act=$locrow['id_section'];
                                    if($id_act == $id){
                                        echo "class='active' ";
                                        $searchactive=false;
                                    }

                                }
                                echo "type='submit' value='$off_name' name='$id'></li>";
                            }
                            echo 
                    "</ul> 
                </td>
                <td width = 23%>
                    <ul class='inout'>";
                    echo "<li><a href='logout.php'>Выйти</a></li>";
                    } else {
                    echo "<li><a href='javascript:LogShow()'>Войти</a></li>
                        <li><a href='javascript:RegShow()'>Зарегистрироваться</a></li>";
                    }
                echo "</ul>
                </td>
            </table>";
            ?>


            <!-- поп-ап для регистрации -->
            <div class="popup" id="regin">
                <div class="popupreg">
                    <div class="reg">
                    <center><p class='info'>Регистрация</p></center>
                        <input type="text" name="name" placeholder="Имя">
                        <br>
                        <input type="text" name="login" placeholder="Логин">
                        <br>
                        <input type="text" name="password" placeholder="Пароль">
                        <br>
                        <div class = "but">
                            <center><input type="submit" name="registr" value="Зарегистрироваться"></center>
                            <center><input type="submit" onClick="RegHide()" value="Закрыть окно"></center>
                        </div>
                    </div>
                </div>
            </div>


            <!-- поп-ап для авторизации -->
            <div class="popup" id="log">
                <div class="popupin">
                    <div class="reg">
                        <p class='info'>Вход</p>
                        <input type="text" name="loginIN" placeholder="Логин">
                        <br>
                        <input type="text" name="passwordIN" placeholder="Пароль">
                        <br>
                        <div class = "but">
                            <center><input type="submit" name="loginBD" value="Войти"></center>
                            <center><input type="submit" onClick="LogHide()" value="Закрыть окно"></center>
                        </div>
                    </div>
                </div>
            </div>


            <!-- поп-ап для добавления раздела -->
            <div class="popup" id="addsect">
                <div class="popupsect">
                    <div class="reg">
                        <p class='info'>Добавление раздела</p>
                        <input type="text" name="sectionname" placeholder="Название раздела">
                        <div class = "but">
                            <center><input type="submit" name="SectAdd" value="Добавить"></center>
                            <center><input type="submit" onClick="PopSectHide();" value="Закрыть окно"></center>
                        </div>
                    </div>
                </div>
            </div>


            <!-- поп-ап для добавления статьи -->
            <div class="popup" id="art_wr">
                <div class="popArt">
                <center><p class='info'>Добавление статьи</p></center>
                    <input type="text" name="titleArt" width="50px" placeholder="Тема статьи">
                    <select name="sectionArt">
                        <?php       //селектор разделов статей
                           require_once('connect.php');
                            $query = mysqli_query($link, "SELECT off_name, id FROM sections WHERE id>1");
                            $first = true;
                            while ($row = mysqli_fetch_assoc($query)) {
                                $id = $row['id'];
                                $off_name=$row['off_name'];
                                echo "<option value='$id'";
                                if ($first) {
                                    echo "selected='selected'";
                                    $first = false;
                                }  
                                echo ">$off_name</option>";
                            }
                        ?>
                    </select>
                    <textarea name="textArt" id="editor1"  cols="45" rows="50"></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('editor1');     
                    </script> 
                    <div class = "but">
                        <center>
                            <input type="submit" onClick="ArtHide()" value="Закрыть окно">
                        </center>
                        <center>
                            <input type="submit" name="AddArticle" value="Добавить статью">
                        </center>
                    </div>
                </div>
            </div>
        
                

            <!-- вывод об успехе или ошибках при попытке регистрации-авторизации -->
            <div class = "fine">
                <?php
                if ($GLOBALS['errs_count'] === 0){
                    echo "<center>Регистрация прошла успешно!</center><br>";
                    $GLOBALS['errs_count'] = -1;
                }
                ?>
            </div>
            <div class = "errors">
                <?php
                    if ($GLOBALS['errs_count'] > 0){
                        echo "<center><b>При регистрации произошли следующие ошибки:</b></center><br>";
                        foreach($GLOBALS['err'] AS $error)
                        {
                            echo "<center>".$error."</center>"."<br>";
                        }
                    }
                    if ($GLOBAL['in_err'] > 0){
                        echo "<center>Логин или пароль введен неправильно</center>";
                    }
                ?>
            </div>

            <?php
                if ($_SESSION['user']){
                    echo "<div class='hello'><center>Здравствуйте, <cont class='main_name'>".$_SESSION['user']['name']."</cont>!</center></div>";
                }
            ?>
            </form> 
            
            
            <!-- основной контент страницы -->
                <?php  
                    if ($_SESSION['user']){
                        require_once('connect.php');
                        $user_id = $_SESSION['user']['id'];
                        $query = mysqli_query($link, "SELECT id_section FROM synhro WHERE id_user = $user_id");
                        $data = mysqli_fetch_assoc($query);
                        $section = $data["id_section"];
                        if ($section==1){
                            echo 
                            "<h1 class='main'>Добро пожаловать на главную страницу!</h1>
                            <p class='info'>
                                Данный сайт посвящен статьям по теме: Стек технологий LAMP. Альтернативные стеки технологий.
                            </p>
                            <div class='but'>
                                <center><input type='submit' onClick='ArtShow();' value='Написать статью!'></center>
                                <center><input type='submit' onClick='PopSectShow();' value='Добавить раздел!'></center>
                            </div>";
                        }
                        else {
                            echo "
                            <form method='post' action='dynamic.php' >";
                            $query = mysqli_query($link, "SELECT content, off_name FROM sections WHERE id = $section");
                            $data = mysqli_fetch_assoc($query);
                            $content = $data["content"];
                            $off_name = $data["off_name"];
                            echo $content;
                            $query = mysqli_query($link, "SELECT id, title, text, user_id, date FROM articles WHERE section = '$off_name' ORDER BY date DESC");
                            
                            while ($row = mysqli_fetch_assoc($query)) {
                                $title = $row['title'];
                                $text=$row['text'];
                                $date = $row['date'];
                                $user_id = $row['user_id'];
                                $indid=$row['id'];
                                $locquery = mysqli_query($link, "SELECT name, login FROM users WHERE id = $user_id");
                                $locdata = mysqli_fetch_assoc($locquery); 
                                $author = $locdata['login'].' ('.$locdata['name'].')';
                                echo "<div class='article'>
                                <h1 class='title'>$title</h1>
                                <p class = 'info'>
                                        <div class='about'>
                                            <input type='submit' name='change$indid'  value='[изменить]'>|<input type='submit'  name = 'del$indid' value='[удалить]'></br>
                                            Автор статьи: $author</br>
                                            Дата создания: $date
                                        </div>
                                    </p>
                                    <div class='textarticle'> 
                                    $text  
                                    <hr class = 'line' margin-left=20% size=2px width=800px align='left' color=' rgb(107, 142, 35)'>
                                     </div></div></br>";
                            }
                        echo "</form>";   
                        }
                    } 
                    else {
                        echo "<p class='info'>
                                Здравствуйте! Вы находитесь на сайте, посвященном учебному материалу по теме 'Стек технологий LAMP и альтернативные стеки технологий'.
                            </p>
                            <p class='info'> Для работы на сайте необходимо авторизироваться (или зарегистрироваться и авторизироваться).</p>
                            <img class='info' src='https://timeweb.com/ru/community/article/44/4439b3fbd1e46e2dad93d84082c5bd9c.png' width='50%'>";
                        }
            ?>
        </form>
    
        <footer id="foot" class="foot">©2021 Оськин Андрей. Курсовая работа по курсу "WEB-технологии ч. 2" </footer>

    </body>

    
</html>