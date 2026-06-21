<?php

namespace Demo\App;

class Hello
{
  public function say(?string $message = null): string
  {
    $this->message = $message;
    return "Hello, " . $this->message . "!";
  }
}
