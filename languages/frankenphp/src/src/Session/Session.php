<?php

namespace Demo\App\Session;

use Demo\App\Session\RedisSessionHandler;

class Session
{

  private static ?self $instance = null;
  private function __construct()
  {
    self::init();
  }

  public static function getInstance(): self
  {
    if (self::$instance === null) {
      self::$instance = new self;
    }

    return self::$instance;
  }
  private static function init()
  {
    // ini_set('session.use_strict_mode', 1);
    // ini_set('session.lazy_write', 1);
    // ini_set('session.save_handler', 'redis');
    // ini_set('session.save_path', 'tcp://redis:6379?prefix=prefix:&timeout=2.5&read_timeout=2.5&persistent=1');
    session_set_save_handler(new RedisSessionHandler);
    session_start();
  }

  public function __destruct()
  {
    session_write_close();
  }
}
