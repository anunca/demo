<?php

namespace Demo\App;

class Kernel
{
  private static ?self $instance = null;
  private function __construct()
  {
    $hello = new Hello();
    $message = $hello->say('world');
    echo $message;
    $hello->anotherMessage = 'anotherMessage';
  }

  public static function getInstance(): self
  {
    if (self::$instance === null) {
      self::$instance = new self;
    }

    return self::$instance;
  }
}
