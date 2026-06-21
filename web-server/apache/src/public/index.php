<?php

$env = getenv('ENV');
$phpVersion = getenv('PHP_VERSION');

echo 'ENV:' . $env . '<br>';
echo 'PHP_VERSION:' . $phpVersion . '<br>';
?>

<br>
<a href="/phpinfo">phpinfo</a>