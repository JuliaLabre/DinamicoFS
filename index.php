<?php
require('includes/config.php');

$route = trim(htmlentities($_SERVER['QUERY_STRING']));

if ($route == '') $route = 'home';

$route = explode('/', $route)[0];

$page = array(
  'php' => "pages/{$route}/index.php",
  'css' => "pages/{$route}/index.css",
  'js' => "pages/{$route}/index.js",
);

if (!file_exists($page['php'])) :

  $page = array(
    'php' => "pages/404/index.php",
    'css' => "pages/404/index.css",
    'js' => "pages/404/index.js",
  );
endif;

require($page['php']);

if (file_exists($page['css']))
  $page_css = "<link rel=\"stylesheet\" href=\"/{$page['css']}\">";

if (file_exists($page['js']))
  $page_js = "<script src=\"/{$page['js']}\"></script>";

if ($page_title == '')
 
  $title = "{$c['sitename']} {$c['titlesep']} {$c['siteslogan']}";
else

  $title = "{$c['sitename']} {$c['titlesep']} {$page_title}";

$fsocial = '<nav><h4>Redes sociais:</h4>';

for ($i = 0; $i < count($s); $i++) :

  $fsocial .= <<<HTML
<a href="{$s[$i]['link']}" target="_blank" title="Acesse nosso {$s[$i]['name']}">
  <i class="fa-brands {$s[$i]['icon']} fa-fw"></i>
  <span>{$s[$i]['name']}</span>
</a>
HTML;

endfor;

$fsocial .= '</nav>';

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="<?php echo $c['sitefavicon'] ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <?php
  echo $page_css;
  ?>
    <title><?php echo $title ?></title>
</head>
<body>
    <div id="wrap">
<header>
<a href="/" title="Página inicial">
        <img src="<?php echo $c['sitelogo'] ?>" alt="Logotipo <?php echo $c['sitename'] ?>">
      </a>
      <h1>
        <?php echo $c['sitename'] ?>
        <small><?php echo $c['siteslogan'] ?></small>
      </h1>
</header>
<nav>  
    <a href="/" title="Página inicial">
        <i class="fa-solid fa-house-chimney fa-fw"></i>
        <span>Início</span>
      </a>
      <a href="/?contacts" title="Faça contato">
        <i class="fa-solid fa-comments fa-fw"></i>
        <span>Contatos</span>
      </a>
      <a href="/?about" title="Sobre a gente">
        <i class="fa-solid fa-circle-info fa-fw"></i>
        <span>Sobre</span>
      </a>
      <a href="/?profile" title="Perfil de usuário">
        <i class="fa-regular fa-user fa-fw"></i>
        <span>Perfil</span>
      </a>
    </nav>
<main><?php
      echo $page_content;
      ?> </main>
<footer>
<div id="copy">&copy; 2022 <?php echo $c['sitename'] ?></div>
<div id="finf">
        <?php
        echo $fsocial;
        ?>
        <nav>
          <h4>Acesso rápido:</h4>
          <a href="/?contacts">
            <i class="fa-solid fa-comments fa-fw"></i>
            <span>Contatos</span>
          </a>
          <a href="/?about">
            <i class="fa-solid fa-circle-info fa-fw"></i>
            <span>Sobre nós</span>
          </a>
          <a href="/?policies">
            <i class="fa-solid fa-user-lock fa-fw"></i>
            <span>Sua privacidade</span>
          </a>
        </nav>
      </div>
     </footer>
</div>
<div id="acCookies">
    <div class="cookieBody">
      <div class="cookieBox">
        <div>
          Usamos cookies para lhe fornecer uma experiência de navegação melhor e mais segura.
          Não se preocupe, todos os seus dados pessoais estão protegidos.
        </div>
        <button id="accept">Entendi!</button>
      </div>
    </div>
  </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="/script.js"></script>
  <?php
  echo $page_js;
  ?>
    
</body>
</html>