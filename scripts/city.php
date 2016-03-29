#!/usr/bin/php -q
<?php

// This code demonstrates how to lookup the country, region, city,
// postal code, latitude, and longitude by IP Address.
// It is designed to work with GeoIP/GeoLite City

// Note that you must download the GEO-133 Format of GeoIP City. The GEO-132 format will not work. Plase them in the folder /usr/local/share/GeoIP/src

include("/usr/local/share/GeoIP/geoipcity.inc");
include("/usr/local/share/GeoIP/geoipregionvars.php");

// uncomment for Shared Memory support
// geoip_load_shared_mem("/usr/local/share/GeoIP/GeoIPCity.dat");
// $gi = geoip_open("/usr/local/share/GeoIP/GeoIPCity.dat",GEOIP_SHARED_MEMORY);

$gi = geoip_open("/usr/local/share/GeoIP/GeoLiteCity.dat", GEOIP_STANDARD);

$ip = $argv[1];
if(!isset($ip)) {
        exit(0);
}
$record = geoip_record_by_addr($gi, $ip);
print $ip . "\t";
print $record->country_code . " " . $record->country_name . "\t";
print $record->city . "\t";
# Link to google map:
print "https://www.google.com/maps/@" . $record->latitude . "," . $record->longitude .",14z";
//print $record->country_code . " " . $record->country_code3 . " " . $record->country_name . " ";
//print $record->region . " " . $GEOIP_REGION_NAME[$record->country_code][$record->region] . " ";
//print $record->city . "\n";
//print $record->postal_code . "\n";
//print $record->latitude . "\n";
//print $record->longitude . "\n";
// print $record->metro_code . "\n";
// print $record->area_code . "\n";
// print $record->continent_code . "\n";
print "\n";

geoip_close($gi);
