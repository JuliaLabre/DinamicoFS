<?php
$c = array(
    'sitename' => 'Monster Devs',
    'siteslogan' => "those who don't hide",
    'sitelogo' => '/img/favicon.png',
    'sitefavicon' => '/img/favicon.png',
    'titlesep' => '-'
);

$s = array(
    array(
        'name' => 'Facebook',
        'link' => 'https://facebook.com',
        'icon' => 'fa-square-facebook'
    ),
    array(
        'name' => 'Youtube',
        'link' => 'https://youtube.com',
        'icon' => 'fa-square-youtube'
    ),
    array(
        'name' => 'GitHub',
        'link' => 'https://github.com',
        'icon' => 'fa-square-github'
    )
);

$page_title = $page_content = $page_css = $page_js = '';

$hostname = 'localhost';
$username = 'root';
$password = '';
$database = 'monsterdevs';

header('Content-Type: text/html; charset=utf-8');

date_default_timezone_set('America/Sao_Paulo');

$conn = new mysqli($hostname, $username, $password, $database);

$conn->query("SET NAMES 'utf8'");
$conn->query('SET character_set_connection=utf8');
$conn->query('SET character_set_client=utf8');
$conn->query('SET character_set_results=utf8');
$conn->query('SET GLOBAL lc_time_names = pt_BR');
$conn->query('SET lc_time_names = pt_BR');

require('functions.php');