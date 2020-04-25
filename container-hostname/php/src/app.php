<?php

function getCurrenTime(): string {

	$currentTime = new \DateTime('NOW');

	return $currentTime->format('Y-m-d\TH:i:s.u');
}

function getCustomHostname(): string {

	$hostname = gethostname();

	if (!$hostname) {
		return "<span style=\"color:red\">there is an error</span>";
	} else {
		return $hostname;
	}
}

function handler() {

	$currentTime = getCurrenTime();
	$hostname = getCustomHostname();

	echo "<h1>PHP</h1>";
	printf("<p>Time: %s</p>", $currentTime);
    printf("<p>Hostname: %s</p>", $hostname);
}

handler();
