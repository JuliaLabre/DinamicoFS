<?php

// Define variáveis do código:
$error = $form_error = $feedback = $form_html = '';

// Inicializa campos do formulário:
$name = $email = $subject = $message = '';

// Se o formulário foi enviado:
if (isset($_POST['send'])) :

  // Obtém o 'name' do formulário e sanitiza:
  $name = htmlspecialchars(trim($_POST['name']));

  // Valida o campo 'name' que deve ter pelo menos 3 caracteres:
  if (strlen($name) < 3)
    $error .= '<li>Seu nome está inválido.</li>';

  // Obtém o 'email' do formuláro e sanitiza:
  $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);

  // Valida o campo 'email' que deve ser um e-mail válido:
  if (!filter_var($email, FILTER_VALIDATE_EMAIL))
    $error .= '<li>Seu e-mail está inválido.</li>';

  // Obtém o campo 'subject' do formulário e sanitiza:
  $subject = htmlspecialchars(trim($_POST['subject']));

  // Valida o campo 'subject' que deve ter pelo menos 5 caracteres:
  if (strlen($subject) < 5)
    $error .= '<li>O assunto está muito curto.</li>';

  // Obtém o campo 'message' e sanitiza:
  $message = htmlspecialchars(trim($_POST['message']));

  // Valida o campo 'message' que deve ter pelo menos 5 caracteres:
  if (strlen($message) < 5)
    $error .= '<li>A mensagem está muito curta.</li>';

  // Se ocorreram erros...
  if ($error != '') :

    // Gera uma mensagem de erro listando os erros obtidos:
    $form_error .= <<<HTML

<div class="form-error">
    <h3>Ooooops!</h3>
    <p>Ocorreram erros no preenchimento do formulário:</p>
    <ul>{$error}</ul>
    <p>Por favor, verifique o preenchimento e tente novamente...</p>
</div>

HTML;

  // Se não ocorreram erros...
  else :

    // Monta SQL para salvar contato no banco de dados:
    $sql = <<<SQL

INSERT INTO contacts (
    name,
    email,
    subject,
    message
) VALUES (
    '{$name}',
    '{$email}',
    '{$subject}',
    '{$message}'
);

SQL;

    // Executa SQL acima:
    $conn->query($sql);

    // Extrai o primeiro nome do remetente:
    $first_name = explode(' ', $name)[0];

    // Monta o feedback para o usuário usando HTML:
    $feedback = <<<HTML

<div class="feedback">
    <h3>Olá {$first_name}!</h3>
    <p>Seu contato foi enviado com sucesso.</p>
    <p><em>Obrigado...</em></p>
</div>
 
HTML;

    // Obtém a data atual, formatada:
    $now = date('d/m/Y à\s H:i');

    // Prepara mensagem de e-mail para o administrador do site:
    $email_message = <<<TXT

Olá!

Um novo contato foi enviado para o site {$c['sitename']}.

 • Data: {$now}
 • Remetente: {$name}
 • E-mail: {$email}
 • Assunto: {$subject}

{$message}

TXT;

    // Envia e-mail para o administrador do site:
    @mail(
      $c['siteemail'],
      "Novo contato no site {$c['sitename']}.",
      $email_message
    );

  // if ($error != '') :
  endif;

// if (isset($_POST['send'])) :
endif;

$form_html = <<<HTML

    <form action="/?contacts" method="post" name="contacts" id="contacts">
        <input type="hidden" name="send" value="true">
    
        <p>Preencha todos os campos abaixo para enviar um contato para a equipe do <strong>Monster Devs</strong>.</p>
    
        <p>
            <label for="name">Nome:</label>
            <input type="text" name="name" id="name" placeholder="Seu nome completo" required minlength="3" value="{$name}">
        </p>
    
        <p>
            <label for="email">E-mail:</label>
            <input type="email" name="email" id="email" placeholder="Seu e-mail principal" required value="{$email}">
        </p>
    
        <p>
            <label for="subject">Assunto:</label>
            <input type="text" name="subject" id="subject" placeholder="Assunto do contato" required minlength="5" value="{$subject}">
        </p>
    
        <p>
            <label for="message">Mensagem:</label>
            <textarea name="message" id="message" placeholder="Sua mensagem" required minlength="5">{$message}</textarea>
        </p>
    
        <p>
            <button type="submit">Enviar</button>
        </p>
    
    </form>&nbsp;
    
HTML;

$page_title = "Faça contato";

$page_content = <<<HTML

<article>

  <h2>Faça contato</h2>
  
  {$form_error}

HTML;

if ($feedback != '')

  $page_content .= $feedback;

else

  $page_content .= $form_html;

$page_content .= <<<HTML

</article>

HTML;