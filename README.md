# grip-strength-estimation


This project uses a nodemcu (ESP8266) and flex sensors to assess grip strength. Grip strength is a crucial indicator of the health and functionality of the hands and can be used to identify problems like arthritis and carpal tunnel syndrome.

In this study, we detect the amount of bend in the fingers when they grasp an object using flex sensors, and we utilise a mathematical model to translate that information into an estimate of grip strength. The sensor data is processed by the nodemcu and quantized signal is processed in MATLAB

The source code is written in Arduino IDE and can be easily uploaded to the NodeMCU board. The schematics and other files provide details on how to connect the flex sensor to the NodeMCU and how to set up the Blynk app to receive and display the sensor data.

Feel free to explore the repository and use the code and schematics to build your own grip strength estimator. If you have any questions or suggestions, please feel free to open an issue or submit a pull request :)
