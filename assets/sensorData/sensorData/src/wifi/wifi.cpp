#include "wifi.h"
#include <WiFi.h>

const char *WIFI_SSID = "botpc";
const char *WIFI_PASSWORD = "982E:56i";

void connectToWifi()
{
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    // Wait for connection
    while (WiFi.status() != WL_CONNECTED)
    {
        delay(1000);
        Serial.println("Connecting to WiFi...");
    }
    Serial.println("Connected to WiFi");
    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());
}
