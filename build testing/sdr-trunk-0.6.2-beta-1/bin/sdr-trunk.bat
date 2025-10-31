@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  sdr-trunk startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and SDR_TRUNK_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="--add-exports=javafx.base/com.sun.javafx.event=ALL-UNNAMED" "--add-exports=java.desktop/com.sun.java.swing.plaf.windows=ALL-UNNAMED" "--add-modules=jdk.incubator.vector" "--enable-preview" "--enable-native-access=ALL-UNNAMED" "--enable-native-access=javafx.graphics" "--sun-misc-unsafe-memory-access=allow" "-Djava.library.path=c:\Program Files\SDRplay\API\x64"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\sdr-trunk-0.6.2-beta-1.jar;%APP_HOME%\lib\libresample4j-master.jar;%APP_HOME%\lib\jmbe-api-1.0.0.jar;%APP_HOME%\lib\java-lame-v3.98.4.jar;%APP_HOME%\lib\radio-reference-api-18.0.0.jar;%APP_HOME%\lib\logback-classic-1.5.18.jar;%APP_HOME%\lib\logback-core-1.5.18.jar;%APP_HOME%\lib\jackson-databind-2.19.1.jar;%APP_HOME%\lib\jackson-core-2.19.1.jar;%APP_HOME%\lib\jackson-annotations-2.19.1.jar;%APP_HOME%\lib\jackson-dataformat-xml-2.19.1.jar;%APP_HOME%\lib\jSerialComm-2.9.3.jar;%APP_HOME%\lib\jiconfont-font_awesome-4.7.0.1.jar;%APP_HOME%\lib\jiconfont-javafx-1.0.0.jar;%APP_HOME%\lib\jiconfont-swing-1.0.1.jar;%APP_HOME%\lib\JTransforms-3.1.jar;%APP_HOME%\lib\gson-2.13.1.jar;%APP_HOME%\lib\guava-33.4.8-jre.jar;%APP_HOME%\lib\jide-oss-3.6.18.jar;%APP_HOME%\lib\miglayout-swing-11.4.2.jar;%APP_HOME%\lib\mp3agic-0.9.1.jar;%APP_HOME%\lib\jarchivelib-1.2.0.jar;%APP_HOME%\lib\commons-compress-1.27.1.jar;%APP_HOME%\lib\commons-csv-1.14.0.jar;%APP_HOME%\lib\commons-io-2.19.0.jar;%APP_HOME%\lib\charts-1.0.5.jar;%APP_HOME%\lib\usb4java-native-libraries-1.3.1.jar;%APP_HOME%\lib\usb4java-javax-1.3.0.jar;%APP_HOME%\lib\usb-api-1.0.2.jar;%APP_HOME%\lib\tablefilter-swing-5.5.4.jar;%APP_HOME%\lib\usb4java-1.3.0.jar;%APP_HOME%\lib\commons-lang3-3.18.0.jar;%APP_HOME%\lib\JLargeArrays-1.6.jar;%APP_HOME%\lib\commons-math3-3.6.1.jar;%APP_HOME%\lib\mina-http-2.2.4.jar;%APP_HOME%\lib\mina-core-2.2.4.jar;%APP_HOME%\lib\controlsfx-11.2.2.jar;%APP_HOME%\lib\slf4j-api-2.0.17.jar;%APP_HOME%\lib\libusb4java-1.3.0-linux-x86.jar;%APP_HOME%\lib\libusb4java-1.3.0-linux-x86-64.jar;%APP_HOME%\lib\libusb4java-1.3.0-win32-x86.jar;%APP_HOME%\lib\libusb4java-1.3.0-win32-x86-64.jar;%APP_HOME%\lib\libusb4java-1.3.0-darwin-x86-64.jar;%APP_HOME%\lib\libusb4java-1.3.0-linux-arm.jar;%APP_HOME%\lib\libusb4java-1.3.0-linux-aarch64.jar;%APP_HOME%\lib\woodstox-core-7.1.1.jar;%APP_HOME%\lib\stax2-api-4.2.2.jar;%APP_HOME%\lib\jiconfont-1.0.0.jar;%APP_HOME%\lib\error_prone_annotations-2.38.0.jar;%APP_HOME%\lib\failureaccess-1.0.3.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jspecify-1.0.0.jar;%APP_HOME%\lib\j2objc-annotations-3.0.0.jar;%APP_HOME%\lib\miglayout-core-11.4.2.jar;%APP_HOME%\lib\commons-codec-1.18.0.jar


@rem Execute sdr-trunk
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SDR_TRUNK_OPTS%  -classpath "%CLASSPATH%" io.github.dsheirer.gui.SDRTrunk %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable SDR_TRUNK_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%SDR_TRUNK_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
