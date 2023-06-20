<?php

require __DIR__ . '/timezone.php';

// require __DIR__ . '/debug.php';
require __DIR__ . '/bot.php';
require __DIR__ . '/config.php';
require __DIR__ . '/i18n.php';

$bot = new Bot($c['key'], $i);
$bot->setwebhook();
$bot->setcommands();
$bot->syncPortClients();
