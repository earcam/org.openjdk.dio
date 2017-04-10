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

It's [GPL v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html), as per the underlying licence http://hg.openjdk.java.net/dio/dev/file/tip/LICENSE


## Using
See this project's assembly.xml for a trivial example of how the libs can be packaged.

### Dependency Management

Latest version can be determined from [central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22).

The DIO library is packaged as an OSGi bundle (note the native library is embedded in the jar):

	<dependency>
		<groupId>io.earcam.wrapped</groupId>
		<artifactId>org.openjdk.dio</artifactId>
		<version>${version.dio}</version>
	</dependency>


The native library can be referenced independently with `<type>so</type>`:
 
	<dependency>
		<groupId>io.earcam.wrapped</groupId>
		<artifactId>org.openjdk.dio</artifactId>
		<version>${version.dio}</version>
		<type>so</type>
	</dependency>

The sample code jar has `<classifier>sample</classifier>`:

	<dependency>
		<groupId>io.earcam.wrapped</groupId>
		<artifactId>org.openjdk.dio</artifactId>
		<version>${version.dio}</version>
		<classifier>sample</classifier>
	</dependency>


### Download tarball archive

A standalone TGZ can be downloaded from [central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22org.openjdk.dio%22%20AND%20g%3A%22io.earcam.wrapped%22).

## Versioning

_Currently just repacking the dev tip. Will create branches for existing 1.0 and 1.1 releases_

The DIO project is active but the cutting of releases appears to lag a little.  So the aim is to get the latest changes into Maven central with no official release version and without trampling on the versions set by the project's developers.

DIO releases to date have been 1.0 and 1.1, from scm logs it appears a 3 part version number is adopted for dev.

A 3 part version number is used in concert with a timestamp as version qualifier.  The timestamp ties to the commit date, and the Mercurial revision and changeset hash can be found in the POM and as manifest headers.

_TODO ping dio mailinglist and query versioning, releases, etc_

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
* https://www.raspberrypi.org/documentation/linux/kernel/building.md
* https://wiki.openjdk.java.net/display/dio/Getting+Started
