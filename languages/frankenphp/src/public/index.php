<a href="/opcache.php">opcache</a>
<br>
<a href="/phpinfo.php">phpinfo</a>
<br>
<a href="/index.html">bootstrap</a>
<br>
<?php

use Demo\App\Kernel;

require_once __DIR__ . '/../vendor/autoload.php';

Kernel::getInstance();

if (isset($_SESSION['foo'])) {
  echo '<pre>' . print_r($_SESSION, true) . '</pre>';
} else {
  $_SESSION['foo'] = ['bar'];
  $_SESSION['bar'] = 'foo';
}
