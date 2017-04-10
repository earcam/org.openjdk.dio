# Wrap of OpenJDK's Device I/O

[![Build Status](https://travis-ci.org/earcam/org.openjdk.dio.svg?branch=master)](https://travis-ci.org/earcam/org.openjdk.dio)
[![Javadocs](http://www.javadoc.io/badge/io.earcam.wrapped/org.openjdk.dio.svg?color=yellowgreen)](http://www.javadoc.io/doc/io.earcam.wrapped/org.openjdk.dio)

This is just a Maven wrapper project around [OpenJDK DIO](https://wiki.openjdk.java.net/display/dio/Main).
 
## Primary purpose

1. Get all of DIO into [Maven Central](http://search.maven.org/), including:
  * jar and native libraries
  * sample code jar, properties and security policy
  * a tarball with script to run the [GPIOLEDSample](http://hg.openjdk.java.net/dio/dev/file/tip/samples/gpio/src/dio/gpio/GPIOLEDSample.java) out of the box
2. Add sufficient OSGi metadata to run happily in _any_ Java 8 OSGi runtime
3. Add maven source and javadoc artifacts to ease development

## Licence

It's [GPL v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html), as per the [underlying licence](http://hg.openjdk.java.net/dio/dev/file/tip/LICENSE). 


## Using
Please refer to the [OpenJDK Device I/O project site](https://wiki.openjdk.java.net/display/dio).

### Dependency Management

Latest version can be determined from [central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22).

The DIO library is packaged as an OSGi bundle (note the native library is embedded in the jar):

	<dependency>
		<groupId>io.earcam.wrapped</groupId>
		<artifactId>org.openjdk.dio</artifactId>
		<version>1.1.1-2017-03-24</version>
	</dependency>


The native library can be referenced independently with `<type>so</type>`:
 
	<dependency>
		<groupId>io.earcam.wrapped</groupId>
		<artifactId>org.openjdk.dio</artifactId>
		<version>1.1.1-2017-03-24</version>
		<type>so</type>
	</dependency>

The sample code jar has `<classifier>sample</classifier>`:

	<dependency>
		<groupId>io.earcam.wrapped</groupId>
		<artifactId>org.openjdk.dio</artifactId>
		<version>1.1.1-2017-03-24</version>
		<classifier>sample</classifier>
	</dependency>


### Download tarball archive

A standalone TGZ can be downloaded from [central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22).

## Versioning

Available versions are: [1.1.0](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22%20AND%20v%3A%221.1.0%22) and [1.1.1-2017-03-24](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22%20AND%20v%3A%221.1.1-2017-03-24%22)

<span style="color:red;font-weight:bold">Please note:</span> do not use wrapped version 1.1

Rather embarrassingly wrapped version [1.1](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22%20AND%20v%3A%221.1%22) is taken from the wrong changeset and should not have been pushed to Maven central...  My embarrassment is now immutable and distributed. 
Please use [1.1.0](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22%20AND%20v%3A%221.1.0%22) instead. 


## Building

Maven project from repo checkout of [http://hg.openjdk.java.net/dio](http://hg.openjdk.java.net/dio)

There are two profiles; Unix x86 amd64 and Unix ARM.  The x86 build cross-compiles using the r-pi tools.

Assuming you've Maven3 and Java8, a prerequisite step for both profiles is:

* Install [Mercurial](https://www.mercurial-scm.org/) (annoyingly there doesn't appear to be a pure Java SCM provider for Mercurial - otherwise the build could be fully self-contained for both).

	sudo apt-get install mercurial


### Raspberry Pi
To build on a Raspberry Pi, just run maven 

	mvn install


### Linux Debian x86 amd64

To cross compile from a Linux amd64_x86 machine, first install Raspberry Pi toolchain:

	sudo mkdir -p /opt/raspberrypi
	cd /opt/raspberrypi
	sudo apt-get install git bc
	git clone https://github.com/raspberrypi/tools
	
	cd /opt/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
	ln -s arm-linux-gnueabihf-gcc gcc		

And then build with `mvn install`.  If you have Raspberry Pi tools in a different location you can provide that with the property **pi.tools**, e.g.
	
	mvn  -Dpi.tools=/some/other/path/to/pi/tools/  install

## TODOs
* Automate the amd64 steps for pi tools
* Maven site as GitHub site, so people can just copy paste GAV for LATEST

## See Also
* [https://www.raspberrypi.org/documentation/linux/kernel/building.md](https://www.raspberrypi.org/documentation/linux/kernel/building.md)
* [https://wiki.openjdk.java.net/display/dio/Getting+Started](https://wiki.openjdk.java.net/display/dio/Getting+Started)
