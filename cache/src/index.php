<?php

$curlHeaders = [];
if (array_key_exists('HTTP_X_FORWARDED_FOR', $_SERVER)){
    $HTTP_X_FORWARDED_FOR = $_SERVER["HTTP_X_FORWARDED_FOR"];
    array_push($curlHeaders, 'X-Forwarded-For: ' . $HTTP_X_FORWARDED_FOR);
}
if (array_key_exists('HTTP_VIA', $_SERVER)){
    $HTTP_VIA = $_SERVER["HTTP_VIA"];
    array_push($curlHeaders, 'Via: ' . $HTTP_VIA);
}
echo "<pre>".print_r($_SERVER, true).'</pre>';
echo "<pre>".print_r($curlHeaders, true).'</pre>';