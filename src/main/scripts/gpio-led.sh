#!/bin/sh

java -Djava.security.policy=etc/gpio.policy  -Djava.library.path=./lib/native   -Djdk.dio.registry=etc/raspberrypi-dio.properties -cp lib/*:lib/ext/*  dio.gpio.GPIOLEDSample
