# PWM control over MQTT with Adafruit IO

A simple remote control application for controlling PWM on a single pin on an esp8266 microcontroller. The app connects to an MQTT broker and subscribes to a topic that publishes a single integer value. This value is then used to set the PWM duty cycle for a pin on the esp8266.

While this app uses the MQTT broker provided by the [Adafruit IO](https://io.adafruit.com) service, any MQTT 3.1+ compatible broker should work. Edit the connection information in `io.lua` if you want to move to a different broker.

## Application

These files need to get loaded onto the esp8266 for the application to work:

- `init.lua`: Runs at startup
- `app.lua`: The main application
- `net.lua`: Wifi setep
- `net_secrets.lua`: Wifi credentials. You need to create this file; see `net_secrets.template` for the format
- `io.lua`: MQTTT broker connection and events
- `io_secrets.lua`: MQTT crendentials and the topic to subscribe to. Use `io_secrets.template` as the basis.

See https://nodemcu.readthedocs.io/en/latest/upload/ for help with uploading code.

## NodeMCU firmware

The application was built on NodeMCU firmware, and needs a few modules to run. Two appropriate firmware images are provided.

Both builds include the same libraries: file, gpio, i2c, mqtt, net, node, pwm, tmr, uart, wifi, tls.

- `nodemcu-512k.bin`: based on NodeMCU 1.5.4.1-final, and small enough to work on esp8266 512KB modules 
- `nodemcu-1mb-plus.bin`: based on NodeMCU release (as of 10/11/2020), and meant for esp8266 modules with 1MB or more of flash

See https://nodemcu.readthedocs.io/en/latest/flash/ for help with flashing firmware.


