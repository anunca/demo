<?php

var_dump($_SERVER['HTTP_HOST']);
echo '<br>';
// echo '<pre>'.print_r($_SERVER, true).'</pre>';
// echo '<br>';
var_dump('HTTP_CLIENT_IP:'.$_SERVER['HTTP_CLIENT_IP']);
echo '<br>';
var_dump('HTTP_X_FORWARDED_FOR:'.$_SERVER['HTTP_X_FORWARDED_FOR']);
echo '<br>';
var_dump('REMOTE_ADDR:'.$_SERVER['REMOTE_ADDR']);
echo '<br>';

$url = 'http://app2:82';
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip = $_SERVER['REMOTE_ADDR'];
}
$headers[] = "X-Forwarded-For: $ip";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

curl_exec($ch);
if(curl_error($ch)) {
    var_dump(curl_error($ch));
} else {
    // echo "<pre>".print_r(curl_getinfo($ch), true)."</pre>";
}
curl_close($ch);
