# ABAP Hello World

The goal of this lecture is set up the necessary development environment for ABAP development.
This development environment consists of several components. The following sections provide links
to documents describing the installation or set-up of theses components.

In particular the development environment for the remainder of the lecture consist of:

- a local installation of the [Eclipse IDE](https://www.eclipse.org/ide/) including the
  [ABAP Development Tools](https://tools.hana.ondemand.com/#abap) for ABAP development
- an instance of the [SAP Business Technology Platform](https://www.sap.com/products/technology-platform/)
  free tier
- an instance of the [SAP BTP ABAP environemt](https://discovery-center.cloud.sap/serviceCatalog/abap-environment?region=all&tab=feature&commercialModel=payg)

At the end of this lecture the usual [Hello World](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program) program to ensure the development environment is ready.

## Installing Eclipse and the ABAP Development Tools

The first step to set up the development environment is to install the Eclipse IDE. There are several possible options. Either download the [Eclipse Installer](https://www.eclipse.org/downloads/) and execute it or
install the suitable [package](https://www.eclipse.org/downloads/packages/) for your system.
On macOS and Linux it is also possible to use a package manager like [Homebrew](https://brew.sh/) or
[APT](<https://en.wikipedia.org/wiki/APT_(software)>).

Once the Eclipse IDE is installed the ABAP Developer Tools plug-ins need to be added. The necessary steps
are described [here](https://tools.hana.ondemand.com/#abap). Basically the following steps need to be
performed:

1. Inside the Eclipse IDE open the menu `Help > Install New Software...`
1. Enter the following URL https://tools.hana.ondemand.com/latest and press `Enter`
   to display the available features.
1. Select ABAP Development Tools and install them.

Once the installation has completed the Eclipse IDE has to be restarted. After the
restart the Eclipse IDE should show a Welcome page similar to the one in the following
image. If the installation was successful, there should be an ABAP Development Tools entry
on the Welcome page. Note, that the Welcome page can always be open using the
menu `Help > Welcome`.

![Eclipse Welcome Screen](imgs/eclipse_welcome_screen)

## SAP BTP Free Tier

## Deploying the SAP BTP ABAP Environment

## ABAP Hello World
