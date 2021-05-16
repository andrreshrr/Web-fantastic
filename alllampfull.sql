-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 28 2021 г., 09:32
-- Версия сервера: 8.0.23
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `alllamp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int NOT NULL COMMENT 'айди статьи',
  `title` varchar(64) NOT NULL COMMENT 'тема статьи',
  `text` text NOT NULL COMMENT 'текст статьи',
  `user_id` int NOT NULL COMMENT 'айди создателя',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'дата создания',
  `section` varchar(64) NOT NULL COMMENT 'раздел'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица для хранения статей';

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `text`, `user_id`, `date`, `section`) VALUES
(39, 'Что такое LAMP?', '<p><strong>LAMP</strong>&nbsp;&mdash;&nbsp;акроним,&nbsp;обозначающий&nbsp;набор&nbsp;(комплекс)&nbsp;серверного&nbsp;программного&nbsp;обеспечения,&nbsp;широко используемый&nbsp;во&nbsp;Всемирной&nbsp;паутине.</p>\r\n\r\n<p>LAMP&nbsp;назван&nbsp;по&nbsp;первым&nbsp;буквам&nbsp;входящих&nbsp;в&nbsp;его&nbsp;состав&nbsp;компонентов:</p>\r\n\r\n<ul>\r\n	<li>&nbsp;&nbsp;&nbsp;&nbsp;<strong>L</strong>inux&nbsp;-&nbsp;операционная&nbsp;система&nbsp;Linux;</li>\r\n	<li>&nbsp;&nbsp;&nbsp;&nbsp;<strong>A</strong>pache&nbsp;-&nbsp;веб-сервер;</li>\r\n	<li>&nbsp;&nbsp;&nbsp;&nbsp;<strong>M</strong>ySQL&nbsp;/&nbsp;MariaDB&nbsp;-&nbsp;система&nbsp;управления&nbsp;базами&nbsp;данных;</li>\r\n	<li>&nbsp;&nbsp;&nbsp;&nbsp;<strong>P</strong>HP&nbsp;-&nbsp;язык&nbsp;программирования,&nbsp;используемый&nbsp;для&nbsp;создания&nbsp;веб-приложений&nbsp;(помимо&nbsp;PHP&nbsp;могут&nbsp;использоваться&nbsp;Perl&nbsp;и&nbsp;Python).</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://timeweb.com/ru/community/article/44/4439b3fbd1e46e2dad93d84082c5bd9c.png\" style=\"border-style:solid; border-width:0px; height:250px; width:1000px\" /></p>\r\n\r\n<p>Изначально&nbsp;эти&nbsp;программные&nbsp;продукты&nbsp;не&nbsp;разрабатывались&nbsp;специально&nbsp;для&nbsp;работы&nbsp;друг&nbsp;с&nbsp;другом, такая&nbsp;связка&nbsp;стала&nbsp;весьма&nbsp;популярной&nbsp;из-за&nbsp;своей&nbsp;гибкости,&nbsp;производительности&nbsp; и&nbsp;низкой стоимости&nbsp;(все&nbsp;её&nbsp;составляющие&nbsp;являются&nbsp;открытыми&nbsp;и&nbsp; могут&nbsp;быть&nbsp;бесплатно&nbsp;загружены&nbsp;из&nbsp;Интернета).</p>\r\n\r\n<p>Набор&nbsp;LAMP&nbsp;входит&nbsp;в&nbsp;состав&nbsp;большинства&nbsp;дистрибутивов&nbsp;Linux&nbsp;и&nbsp;предоставляется&nbsp;многими хостинговыми&nbsp;компаниями.</p>\r\n\r\n<p>Весомое&nbsp;<strong>преимущество</strong>&nbsp;данной&nbsp;сборки:&nbsp;она&nbsp;замечательно&nbsp;подходит&nbsp;для&nbsp;быстрого&nbsp;развертывания&nbsp;приложения,&nbsp;из-за&nbsp;простой&nbsp;конфигурации, но&nbsp;все&nbsp;же&nbsp;она&nbsp;дает&nbsp;мало&nbsp;функций&nbsp;в&nbsp;плане&nbsp;масштабируемости&nbsp;и&nbsp;изоляции&nbsp;компонентов.&nbsp;</p>\r\n\r\n<p>Среди&nbsp;<strong>недостатков</strong>&nbsp;подобной&nbsp;сборки&nbsp;следует&nbsp;выделить&nbsp;следующие: Приложение&nbsp;и&nbsp;база&nbsp;данных&nbsp;используют&nbsp;одни&nbsp;и&nbsp;те&nbsp;же&nbsp;ресурсы&nbsp;сервера&nbsp;(CPU,&nbsp;память,&nbsp;I/O&nbsp;и&nbsp;т.д.), что&nbsp;дает&nbsp;низкую&nbsp;производительность&nbsp;и&nbsp;затрудняет&nbsp;определение&nbsp;источника&nbsp; (приложение&nbsp;или&nbsp;база&nbsp;данных)&nbsp;этой&nbsp;проблемы.&nbsp; Так&nbsp;же&nbsp;есть&nbsp;помехи&nbsp;в&nbsp;осуществлении&nbsp;горизонтального&nbsp;масштабирования.</p>\r\n', 4, '2021-04-27 16:39:46', 'Всё о LAMP'),
(40, 'О Linux', '<p>Linux&nbsp;(в части случаев&nbsp;GNU/Linux)&nbsp;&mdash; семейство&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Unix-%D0%BF%D0%BE%D0%B4%D0%BE%D0%B1%D0%BD%D0%B0%D1%8F_%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0\">Unix-подобных операционных систем</a>&nbsp;на базе&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%AF%D0%B4%D1%80%D0%BE_Linux\">ядра Linux</a>, включающих тот или иной набор утилит и программ проекта&nbsp;<a href=\"https://ru.wikipedia.org/wiki/GNU\">GNU</a>, и, возможно, другие компоненты. Как и ядро Linux, системы на его основе, как правило, создаются и распространяются в соответствии с моделью разработки&nbsp;<a href=\"https://ru.wikipedia.org/wiki/FOSS\">свободного и открытого программного обеспечения</a>. Linux-системы распространяются в основном бесплатно в виде различных&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D1%81%D1%82%D1%80%D0%B8%D0%B1%D1%83%D1%82%D0%B8%D0%B2_Linux\">дистрибутивов</a>&nbsp;&mdash; в форме, готовой для установки и удобной для сопровождения и обновлений,&nbsp;&mdash; и имеющих свой набор&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%BD%D0%BE%D0%B5_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%BD%D0%BE%D0%B5_%D0%BE%D0%B1%D0%B5%D1%81%D0%BF%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5\">системных</a>&nbsp;и&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%B8%D0%BA%D0%BB%D0%B0%D0%B4%D0%BD%D0%BE%D0%B5_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%BD%D0%BE%D0%B5_%D0%BE%D0%B1%D0%B5%D1%81%D0%BF%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5\">прикладных</a>&nbsp;компонентов, как свободных, так и проприетарных (собственнических).</p>\r\n\r\n<p>Linux-системы реализуются на модульных принципах, стандартах и соглашениях, заложенных в Unix в течение 1970-х и 1980-х годов. Такая система использует&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%9C%D0%BE%D0%BD%D0%BE%D0%BB%D0%B8%D1%82%D0%BD%D0%BE%D0%B5_%D1%8F%D0%B4%D1%80%D0%BE\">монолитное ядро</a>, которое управляет процессами, сетевыми функциями,&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B8%D1%84%D0%B5%D1%80%D0%B8%D0%B9%D0%BD%D0%BE%D0%B5_%D1%83%D1%81%D1%82%D1%80%D0%BE%D0%B9%D1%81%D1%82%D0%B2%D0%BE\">периферией</a>&nbsp;и доступом к&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%A4%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%B0%D1%8F_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0\">файловой системе</a>.&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%94%D1%80%D0%B0%D0%B9%D0%B2%D0%B5%D1%80_%D1%83%D1%81%D1%82%D1%80%D0%BE%D0%B9%D1%81%D1%82%D0%B2%D0%B0\">Драйверы устройств</a>&nbsp;либо интегрированы непосредственно в ядро, либо добавлены в виде&nbsp;<a href=\"https://ru.wikipedia.org/w/index.php?title=%D0%9C%D0%BE%D0%B4%D1%83%D0%BB%D1%8C_%D1%8F%D0%B4%D1%80%D0%B0_Linux&amp;action=edit&amp;redlink=1\">модулей</a>, загружаемых во время работы системы.</p>\r\n\r\n<p>Отдельные программы, взаимодействуя с ядром, обеспечивают функции системы более высокого уровня. Например,&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D1%81%D1%82%D0%B2%D0%BE_%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F\">пользовательские компоненты</a>&nbsp;GNU являются важной частью большинства Линукс-систем, включающей в себя наиболее распространённые реализации&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%A1%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82%D0%BD%D0%B0%D1%8F_%D0%B1%D0%B8%D0%B1%D0%BB%D0%B8%D0%BE%D1%82%D0%B5%D0%BA%D0%B0_%D1%8F%D0%B7%D1%8B%D0%BA%D0%B0_%D0%A1%D0%B8\">библиотеки языка Си</a>, популярных&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%9E%D0%B1%D0%BE%D0%BB%D0%BE%D1%87%D0%BA%D0%B0_%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%B9_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B\">оболочек операционной системы</a>, и многих других общих&nbsp;<a href=\"https://ru.wikipedia.org/w/index.php?title=%D0%9F%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B_UNIX-%D0%BF%D0%BE%D0%B4%D0%BE%D0%B1%D0%BD%D1%8B%D1%85_%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D1%85_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC&amp;action=edit&amp;redlink=1\">инструментов Unix</a>, которые выполняют многие основные задачи операционной системы.</p>\r\n', 4, '2021-04-25 10:59:18', 'Всё о LAMP'),
(41, 'Apache ', '<p><strong>Apache HTTP-сервер</strong>&nbsp;&mdash;&nbsp;свободный&nbsp;веб-сервер.</p>\r\n\r\n<p>Apache является&nbsp;кроссплатформенным ПО, поддерживает операционные системы&nbsp;<em>Linux</em>,&nbsp;BSD,&nbsp;Mac OS,&nbsp;Microsoft Windows,&nbsp;Novell NetWare,&nbsp;BeOS.</p>\r\n\r\n<p>Основными достоинствами Apache считаются надёжность и гибкость конфигурации. Он позволяет подключать внешние модули для предоставления данных, использовать&nbsp;СУБД&nbsp;для&nbsp;аутентификации&nbsp;пользователей, модифицировать сообщения об ошибках и&nbsp;т.&nbsp;д. Поддерживает&nbsp;IPv4.</p>\r\n\r\n<h3>Архитектура</h3>\r\n\r\n<p>Apache состоит из ядра и динамической модульной системы. Параметры системы изменяются с помощью конфигурационных файлов.</p>\r\n\r\n<h3>Ядро</h3>\r\n\r\n<p>Ядро Apache разработано Apache Software Foundation на языке C. Основные функции &mdash; обработка конфигурационных файлов, протокол HTTP/HTTPS и загрузка модулей. Ядро может работать без модулей, но будет иметь ограниченный функционал.</p>\r\n\r\n<h3>Модульная система</h3>\r\n\r\n<p>Модуль &ndash; отдельный файл, подключение которого расширяет изначальный функционал ядра. Они могут включаться в состав ПО при первоначальной установке или подгружаться позже через изменение конфигурационного файла.</p>\r\n\r\n<p>Большинство из них отвечает за определенный аспект обработки клиентского запроса &ndash; поддержку различных языков программирования, безопасность, кэширование, аутентификацию и т.д. Таким образом, большая задача разбивается на несколько фаз, каждую из которых решает отдельный, узкоспециализированный модуль.</p>\r\n\r\n<p>Для Apache существует больше <strong>500</strong> модулей. Многие популярные веб-приложения сразу выпускаются в виде модуля к Apache. Например, ISPmanager и VDSmanager.</p>\r\n\r\n<h3>Конфигурация</h3>\r\n\r\n<p>Система конфигурации Apache работает на текстовых файлах с прописанными настройками. Она подразделяется на три условных уровня, для каждого из которых имеется свой конфигурационный файл:</p>\r\n\r\n<ol>\r\n	<li>Уровень конфигурации сервера (файл&nbsp;<strong>httpd.conf</strong>) &ndash; основной конфигурационный файл. Действие распространяется на весь механизм веб-сервера.</li>\r\n	<li>Уровень каталога (файл&nbsp;<strong>.htaccess</strong>) &ndash; дополнительный конфигурационный файл. Его директивы охватывают только каталог, где расположен файл, а также вложенные подкаталоги.</li>\r\n	<li>Уровень виртуального хоста (файл&nbsp;<strong>httpd.conf</strong>&nbsp;или&nbsp;<strong>extra/httpd-vhosts.conf</strong>).</li>\r\n</ol>\r\n\r\n<p>Обычно конфигурационные файлы Apache находятся в папке &laquo;conf&raquo;, а дополнительные конфигурационные файлы во вложенной в нее папке &laquo;extra&raquo;. Внести изменения можно как через редактирование самого файла, так и через командную строку.</p>\r\n\r\n<h3>Виртуальные хосты</h3>\r\n\r\n<p>Веб-хост &ndash; это компонент сервера, отвечающий за обслуживание одного размещенного на нем объекта (сайта, виртуального сервера). Система виртуальных хостов Apache позволяет одновременно запускать несколько проектов с одного IP-адреса.</p>\r\n\r\n<p>В Apache можно установить настройки модуля и ядра, а также вводить лимиты на потребление серверных ресурсов (трафик, RAM, CPU) для каждого виртуального хоста в отдельности. Это технологическая основа всего механизма веб-хостинга.</p>\r\n', 9, '2021-04-26 13:00:40', 'Всё о LAMP'),
(42, 'MySQL', '<p><strong>MySQL</strong> &mdash; это реляционная база данных (СУБД). Реляционная &mdash; значит внутри неё есть данные, которые связаны между собой, и&nbsp;эту связь можно представить в&nbsp;виде таблиц.&nbsp;</p>\r\n\r\n<p>Технически MySQL &mdash; это много таблиц, как-то связанных между собой. Например, одна отвечает за товары, другая &mdash; за покупки, третья &mdash; за клиентов.</p>\r\n\r\n<p>MySQL является решением для малых и средних приложений. Входит в состав серверов&nbsp;<a href=\"https://ru.wikipedia.org/wiki/WAMP\">WAMP</a>,&nbsp;<a href=\"https://ru.wikipedia.org/w/index.php?title=AppServ&amp;action=edit&amp;redlink=1\">AppServ</a>,&nbsp;<span class=\"marker\"><em>LAMP</em></span>&nbsp;и в портативные сборки серверов&nbsp;<a href=\"https://ru.wikipedia.org/wiki/%D0%94%D0%B5%D0%BD%D0%B2%D0%B5%D1%80_(%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B0)\">Денвер</a>,&nbsp;<a href=\"https://ru.wikipedia.org/wiki/XAMPP\">XAMPP</a>,&nbsp;<a href=\"https://ru.wikipedia.org/w/index.php?title=VertrigoServ&amp;action=edit&amp;redlink=1\">VertrigoServ</a>. Обычно MySQL используется в качестве сервера, к которому обращаются локальные или удалённые клиенты, однако в дистрибутив входит библиотека внутреннего сервера, позволяющая включать MySQL в автономные программы.</p>\r\n\r\n<p>Гибкость СУБД MySQL обеспечивается поддержкой большого количества типов таблиц: пользователи могут выбрать как таблицы типа&nbsp;<a href=\"https://ru.wikipedia.org/wiki/MyISAM\">MyISAM</a>, поддерживающие полнотекстовый поиск, так и таблицы&nbsp;<a href=\"https://ru.wikipedia.org/wiki/InnoDB\">InnoDB</a>, поддерживающие транзакции на уровне отдельных записей. Более того, СУБД MySQL поставляется со специальным типом таблиц EXAMPLE, демонстрирующим принципы создания новых типов таблиц. Благодаря открытой архитектуре и GPL-лицензированию, в СУБД MySQL постоянно появляются новые типы таблиц.</p>\r\n\r\n<p>MySQL портирована на большое количество платформ:&nbsp;AIX,&nbsp;BSDi,&nbsp;FreeBSD,&nbsp;HP-UX,<span class=\"marker\">&nbsp;Linux</span>,&nbsp;macOS,&nbsp;NetBSD,&nbsp;OpenBSD,&nbsp;OS/2&nbsp;Warp,&nbsp;SGI&nbsp;IRIX,&nbsp;Solaris,&nbsp;SunOS,&nbsp;SCO OpenServer,&nbsp;UnixWare,&nbsp;Tru64,&nbsp;Windows 95,&nbsp;Windows 98,&nbsp;Windows NT,&nbsp;Windows 2000,&nbsp;Windows XP,&nbsp;Windows Server 2003, WinCE,&nbsp;Windows Vista,&nbsp;Windows <a href=\"https://ru.wikipedia.org/wiki/Windows_7\">7</a>&nbsp;и&nbsp;Windows 10. Существует также порт MySQL к&nbsp;OpenVMS. На официальном сайте СУБД для свободной загрузки предоставляются не только исходные коды, но и откомпилированные и оптимизированные под конкретные операционные системы готовые исполняемые модули&nbsp;СУБД&nbsp;MySQL.</p>\r\n', 23, '2021-04-26 16:15:45', 'Всё о LAMP'),
(43, 'Немного о PHP', '<h3><strong>Что такое PHP?</strong></h3>\r\n\r\n<p><strong>PHP</strong>&nbsp;(рекурсивный акроним словосочетания&nbsp;<code>PHP: Hypertext Preprocessor</code>) - это распространённый язык программирования общего назначения с открытым исходным кодом. PHP специально сконструирован для веб-разработок и его код может внедряться непосредственно в HTML.</p>\r\n\r\n<p><strong>Пример кода на PHP</strong></p>\r\n\r\n<pre>\r\n<!--?php\r\n        echo \"Привет, я - скрипт PHP!\";\r\n        ?--><!--?php\r\n        echo \"Привет, я - скрипт PHP!\";\r\n        ?-->\r\n\r\n&lt;!DOCTYPE html&gt;\r\n&lt;html&gt;\r\n    &lt;head&gt;\r\n        &lt;title&gt;Пример&lt;/title&gt;\r\n    &lt;/head&gt;\r\n    &lt;body&gt;\r\n\r\n        &lt;?php\r\n        echo &quot;Привет, я - скрипт PHP!&quot;;\r\n        ?&gt;\r\n\r\n    &lt;/body&gt;\r\n&lt;/html&gt;</pre>\r\n\r\n<p>Вместо рутинного вывода HTML-кода командами языка (как это происходит, например, в Perl или C), скрипт PHP содержит HTML с встроенным кодом (в нашем случае, это вывод текста &quot;Привет, я - скрипт PHP!&quot;). Код PHP отделяется специальными&nbsp;<a href=\"https://www.php.net/manual/ru/language.basic-syntax.phpmode.php\">начальным и конечным тегами&nbsp;<code><!--?php</code-->&nbsp;и&nbsp;<code>?&gt;</code></code></a><code>, которые позволяют &quot;переключаться&quot; в &quot;PHP-режим&quot; и выходить из него.</code></p>\r\n\r\n<p><code>PHP отличается от JavaScript тем, что PHP-скрипты выполняются на сервере и генерируют HTML, который посылается клиенту. Если бы у вас на сервере был размещён скрипт, подобный вышеприведённому, клиент получил бы только результат его выполнения, но не смог бы выяснить, какой именно код его произвёл. Вы даже можете настроить свой сервер таким образом, чтобы обычные HTML-файлы обрабатывались процессором PHP, так что клиенты даже не смогут узнать, получают ли они обычный HTML-файл или результат выполнения скрипта.</code></p>\r\n\r\n<p><code>PHP крайне прост для освоения, но вместе с тем способен удовлетворить запросы профессиональных программистов. Не пугайтесь длинного списка возможностей PHP. Вы можете быстро начать, и уже в течение нескольких часов сможете создавать простые PHP-скрипты.</code></p>\r\n\r\n<p><code>Хотя PHP, главным образом, предназначен для работы в среде веб-серверов, область его применения не ограничивается только этим. Читайте дальше и не пропустите главу&nbsp;<a href=\"https://www.php.net/manual/ru/intro-whatcando.php\">Возможности PHP</a>&nbsp;либо, начните непосредственно с&nbsp;<a href=\"https://www.php.net/manual/ru/tutorial.php\">Вводного руководства</a>, если вас интересует исключительно веб-программирование.</code></p>\r\n', 23, '2021-04-26 17:31:04', 'Всё о LAMP'),
(44, 'XAMPP', '<p><strong>XAMPP</strong>&nbsp;&mdash; кроссплатформенная сборка локального веб-сервера, содержащая&nbsp;Apache,&nbsp;MySQL, интерпретатор скриптов&nbsp;PHP, язык программирования&nbsp;Perl&nbsp;и большое количество дополнительных библиотек, позволяющих запустить полноценный веб-сервер.</p>\r\n\r\n<p><strong>XAMPP</strong>&nbsp;&mdash; это&nbsp;акроним:</p>\r\n\r\n<ul>\r\n	<li><strong>X</strong>&nbsp;(любая из четырех операционных систем);</li>\r\n	<li><strong>A</strong>pache;</li>\r\n	<li><strong>M</strong>ySQL;</li>\r\n	<li><strong>P</strong>HP;</li>\r\n	<li><strong>P</strong>erl;</li>\r\n</ul>\r\n\r\n<h2>Пакеты XAMPP</h2>\r\n\r\n<p>Полный пакет содержит:</p>\r\n\r\n<ul>\r\n	<li>Web-сервер&nbsp;Apache;&nbsp;</li>\r\n	<li>СУБД&nbsp;MySQL;</li>\r\n	<li>PHP;</li>\r\n	<li>Perl;</li>\r\n	<li>FTP-сервер&nbsp;FileZilla;</li>\r\n	<li>POP3/SMTP сервер;</li>\r\n	<li>утилиту&nbsp;phpMyAdmin;</li>\r\n</ul>\r\n\r\n<p>XAMPP работает со всеми 32-х разрядными&nbsp;ОС&nbsp;Microsoft&nbsp;(98/2000/XP/2003/Vista/7), а также с&nbsp;Linux,&nbsp;Mac OS X&nbsp;и&nbsp;Solaris. Программа свободно распространяется согласно лицензии&nbsp;GNU General Public License&nbsp;и является бесплатным, удобным в работе web-сервером, способным обслуживать динамические страницы. Количество скачанных пакетов XAMPP в октябре 2008&nbsp;г.&nbsp;&mdash; 775064 загрузок (33280 Гб).</p>\r\n\r\n<p>На сегодняшний день xampp является одной из лучших сборок веб-сервера, с помощью этой сборки вы сможете быстро развернуть на своем компьютере полноценный и быстрый веб-сервер.</p>\r\n\r\n<h3>XAMPP для Linux</h3>\r\n\r\n<p>Пакет для Linux протестирован на Ubuntu, SuSE, RedHat, Mandriva, Debian и включает: Apache, MySQL, PHP 5 + PHP 4 &amp; PEAR, Perl, ProFTPD, phpMyAdmin, OpenSSL, GD, Freetype2, libjpeg, libpng, gdbm, zlib, expat, Sablotron, libxml, Ming, Webalizer, pdf class, ncurses, mod_perl, FreeTDS, gettext, mcrypt, mhash, eAccelerator, SQLite и IMAP C-Client, FPDF. Изначально не запускается при каждом запуске системы его нужно запускать вручную, однако можно его приспособить к постоянному запуску при каждом старте системы.</p>\r\n\r\n<h3>XAMPP для Mac OS X</h3>\r\n\r\n<p>Пакет для Mac OS X включает: Apache, MySQL, PHP &amp; PEAR, SQLite, Perl, ProFTPD, phpMyAdmin, OpenSSL, GD, Freetype2, libjpeg, libpng, zlib, Ming, Webalizer, mod_perl, eAccelerator, phpSQLiteAdmin.</p>\r\n\r\n<h3>XAMPP для Solaris</h3>\r\n\r\n<p>Пакет для Solaris разработан и протестирован на Solaris 8, протестирован на Solaris 9 содержит: Apache, MySQL, PHP &amp; PEAR, Perl, ProFTPD, phpMyAdmin, OpenSSL, Freetype2, libjpeg, libpng, zlib, expat, Ming, Webalizer, pdf class.</p>\r\n', 24, '2021-04-27 17:47:50', 'Альтернативные стеки технологий'),
(45, 'LEMP', '<p>Набор <strong>LEMP</strong> &mdash; это комплекс программного обеспечения, используемый для обслуживания динамических веб-страниц и веб-приложений. Аббревиатура LEMP обозначает операционную систему&nbsp;<strong>L</strong>inux с веб-сервером Nginx (произносится как &laquo;<strong>э</strong>нджинкс&raquo;). Данные серверной части хранятся в базе данных&nbsp;<strong>M</strong>ySQL, а динамическая обработка выполняется&nbsp;<strong>P</strong>HP.</p>\r\n\r\n<p>Стек&nbsp;<strong>LEMP</strong>&nbsp;обычно используется для размещения динамических веб-сайтов. Например систем управления контентом, таких как&nbsp;<a href=\"https://setiwik.ru/ustanovka-wordpress-so-stekom-lemp-na-ubuntu-20-04/\">WordPress</a>,&nbsp;Drupal,&nbsp;Joomla,&nbsp;<a href=\"https://setiwik.ru/kak-ustanovit-moodle-na-ubuntu-20-04/\">Moodle&nbsp;</a>и другие.</p>\r\n\r\n<p>Все его компоненты содержат открытый исходный ход.</p>\r\n', 24, '2021-04-27 17:52:52', 'Альтернативные стеки технологий'),
(46, 'MEAN', '<p><strong>MEAN</strong>&nbsp;(аббревиатура от&nbsp;<a href=\"https://ru.wikipedia.org/wiki/MongoDB\">MongoDB</a>,&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Express.js\">Express.js</a>,&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Angular.js\">Angular.js</a>,&nbsp;<a href=\"https://ru.wikipedia.org/wiki/Node.js\">Node.js</a>)&nbsp;&mdash; набор (&laquo;стек&raquo;) серверного программного обеспечения, который, подобно&nbsp;<span class=\"marker\">LAMP</span>, используется для&nbsp;веб-разработки, ориентированный на&nbsp;JavaScript: все компоненты стека поддерживают программирование на JavaScript, и&nbsp;серверная и клиентская часть&nbsp;MEAN-приложений может быть написана на этом языке программирования. За слой хранения в стеке отвечает&nbsp;документоориентированная СУБД&nbsp;MongoDB; основная платформа исполнения&nbsp;&mdash; серверная JavaScript-платформа&nbsp;Node.js, серверная разработка реализуется посредством работающего поверх Node.js&nbsp;каркаса&nbsp;Express.js, а разработка интерфейсной, браузерной части веб-приложений&nbsp;&mdash;&nbsp;MVC-фреймворком&nbsp;Angular.js.</p>\r\n\r\n<p>По сравнению с &laquo;классическим&raquo; стеком LAMP, MEAN отличает несколько аспектов. Место традиционной&nbsp;реляционной системы управления базами данных&nbsp;MySQL&nbsp;заняла бессхемная&nbsp;документо-ориентированная&nbsp;NoSQL-система;&nbsp;<span class=\"marker\">Linux</span>&nbsp;(или какая-то другая&nbsp;операционная система) больше не является частью стека, поскольку MEAN кросплатформенна и менее зависима от специфики операционной системы, и фокусируется, прежде всего, на привязке к языку программирования&nbsp;<a href=\"https://ru.wikipedia.org/wiki/ECMAScript\">JavaScript</a>, лежащему в основе Node.js&nbsp;&mdash; платформы, исполняющей также и роль веб-сервера (заменяя&nbsp;Apache&nbsp;в LAMP). Работа MongoDB напрямую с данными в формате&nbsp;JSON&nbsp;обеспечивает простоту разработки в стиле&nbsp;REST, не требуя избыточных затрат на разбор и преобразование форматов.</p>\r\n\r\n<p>Важная особенность MEAN&nbsp;&mdash; переход от генерации&nbsp;веб-страниц&nbsp;на стороне сервера к созданию преимущественно&nbsp;одностраничных приложений, перенос ядра реализации&nbsp;MVC&nbsp;со стороны сервера на сторону клиента, что обеспечивается включением в состав стека Angular.js (притом входящий в состав стека фреймворк Express.js обеспечивает и традиционную маршрутизацию и генерацию страниц на стороне сервера).</p>\r\n', 24, '2021-04-27 17:58:16', 'Альтернативные стеки технологий'),
(47, 'Преимущества и недостатки стеков', '<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<caption>\r\n	<h2>Сравнение</h2>\r\n	</caption>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">Название стека</th>\r\n			<th scope=\"col\">Преимущества</th>\r\n			<th scope=\"col\">Недостатки</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>LAMP/LEMP</td>\r\n			<td>\r\n			<ol>\r\n				<li>Быстрое развертывание приложения из-за&nbsp;простой&nbsp;конфигурации;</li>\r\n				<li>Гибкость при подборе баз данных, web серверов и языков сценариев;</li>\r\n				<li>Все компоненты имеют открытый исходный ход;</li>\r\n				<li>Каждый из компонентов полностью настраивается;</li>\r\n				<li>Существует довольно долго и имеет хорошую поддержку;</li>\r\n				<li>Хорошая репутация в области безопасности и стабильности.</li>\r\n			</ol>\r\n			</td>\r\n			<td>\r\n			<ol>\r\n				<li>Приложение&nbsp;и&nbsp;база&nbsp;данных&nbsp;используют&nbsp;одни&nbsp;и&nbsp;те&nbsp;же&nbsp;ресурсы&nbsp;сервера&nbsp;(CPU,&nbsp;память,&nbsp;I/O&nbsp;и&nbsp;т.д.), что&nbsp;дает&nbsp;низкую&nbsp;производительность;</li>\r\n				<li>Работает только на Linux.</li>\r\n			</ol>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>XAMPP</td>\r\n			<td>\r\n			<ol>\r\n				<li>Мультиплатформенность (работает на Windows, Linux, Mac, Solaris);</li>\r\n				<li>Возможность устанавливать множество расширений;</li>\r\n			</ol>\r\n			</td>\r\n			<td>\r\n			<ol>\r\n				<li>Из-за числа модулей имеет более высокую сложность;</li>\r\n				<li>Полная версия занимает много памяти.</li>\r\n			</ol>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>MEAN</td>\r\n			<td>\r\n			<ol>\r\n				<li>Только один язык для разработки стека;</li>\r\n				<li>Использует очень низкий объем памяти;</li>\r\n				<li>Полностью кроссплатформена, привязана только к языку JavaScript;</li>\r\n			</ol>\r\n			</td>\r\n			<td>\r\n			<ol>\r\n				<li>Плохая изоляция сервера от бизнес-логики приложения;</li>\r\n				<li>Невозможно превзойти реляционную базу данных;</li>\r\n				<li>Проблемы безопасности;</li>\r\n				<li>Стек довольно новый и у него отсутствует широкая поддержка.</li>\r\n			</ol>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 4, '2021-04-27 21:18:26', 'Сравнение стеков');

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL COMMENT 'айди раздела',
  `content` text NOT NULL COMMENT 'содержимое раздела ',
  `off_name` varchar(64) NOT NULL COMMENT 'полное имя раздела'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sections`
--

INSERT INTO `sections` (`id`, `content`, `off_name`) VALUES
(1, '', 'Главная'),
(2, '<p class=\'info\'>Здесь вы можете читать статьи, связанные с определением LAMP</p> ', 'Всё о LAMP'),
(3, '<p class=\'info\'>Здесь вы можете читать статьи про альтернативные стеки технологий</p>', 'Альтернативные стеки технологий'),
(4, '<p class=\'info\'>Здесь вы можете читать статьи про сравнение различных стеков технологий</p>', 'Сравнение стеков');

-- --------------------------------------------------------

--
-- Структура таблицы `synhro`
--

CREATE TABLE `synhro` (
  `id_user` int NOT NULL COMMENT 'айди юзера',
  `id_section` int NOT NULL DEFAULT '1' COMMENT 'секция на которой он находится'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `synhro`
--

INSERT INTO `synhro` (`id_user`, `id_section`) VALUES
(4, 3),
(9, 2),
(20, 1),
(21, 1),
(22, 4),
(23, 2),
(24, 4),
(25, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT 'айди пользователя',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Ff' COMMENT 'имя пользователя',
  `login` varchar(64) NOT NULL COMMENT 'логин пользователя',
  `password` varchar(64) NOT NULL COMMENT 'пароль пользователя'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='таблица с пользователями';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `password`) VALUES
(4, 'Андрей', 'rreshrr', 'fd66c4da6d568a2df7af941b71760eb4'),
(9, 'sss', 'sss', 'e9a10ed878c26db3233293357112a846'),
(25, 'Луиджи', 'luidgi', '98c1c6c495fd4db68b4578398d6bec96'),
(24, 'Харитонов Серегей', 'sergey', '98c1c6c495fd4db68b4578398d6bec96'),
(20, 'speedy', 'speedy', '15bc95f83428d3af1a0ed6d2b6285ea6'),
(23, 'Васюков Кирилл', 'kirill', '98c1c6c495fd4db68b4578398d6bec96'),
(22, 'Владимир', 'volodya2003', '665f644e43731ff9db3d341da5c827e1');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `synhro`
--
ALTER TABLE `synhro`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди статьи', AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди раздела', AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'айди пользователя', AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
