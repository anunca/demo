<?php

namespace Demo\App;

use Demo\App\Session\Session;

class Kernel
{
  private static ?self $instance = null;
  private function __construct()
  {
    Session::getInstance();
  }

  public static function getInstance(): self
  {
    if (self::$instance === null) {
      self::$instance = new self;
    }

    return self::$instance;
  }
}
