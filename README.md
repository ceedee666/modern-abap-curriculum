# Modern ABAP Curriculum

This repository contains the documentation and source code for an ABAP
curriculum developed as part of the [WiLMo](https://www.dh.nrw/kooperationen/OERContent.nrw%202021-95) project.

## Overview

ABAP is the proprietary
programming language developed by [SAP SE](https://www.sap.com/). It is the basis of the ERP-Software offered by SAP. ABAP was initially
introduced in 1976. This [blog post](https://blogs.sap.com/2022/09/01/evolution-of-abap/) by [Karl Kessler](https://people.sap.com/karl.kessler)
gives a nice summary of the history of the ABAP programming language. The goal of this curriculum is to provide an
introduction to modern ABAP programming in the context of [SAP S/4HANA](https://en.wikipedia.org/wiki/SAP_S/4HANA) and
the SAP Business Technology Platform (BTP).

### Learning Objectives

The curriculum has the following learning objectives:

1. Students should be able to compare the advantages and disadvantages of using different extension technology for a given requirement
   based on a thorough understanding of the SAP S/4HANA architecture. This is required in order to select
   a suitable extension approach in a give scenario.
1. Students should be able to implement extension to a SAP S/4HANA system using state of the art ABAP in order to
   automate business processes not implemented in the SAP S/4HANA standard.
1. Students are able to implement extensions using the ABAP RAP framework and Fiori Elements in order to enhance
   SAP S/4HANA using the SAP best practices.

## Prerequisites

### ABAP Development Environment

This curriculum does not provide any instruction on how to set up an ABAP development environment.
For students and lecturers at universities different options exist for getting access to an ABAP development environment.
The [SAP University Competence Centers](https://www.sap-ucc.com/) offer ABAP development system to universities (cf. the 
[product list](https://portal.ucc.ovgu.de/services-produkte_rv/produktliste/) of the [SAP UCC Magdeburg](https://portal.ucc.ovgu.de/)). 
A possible alternative is the usage of the [trail or free tier offerings](https://www.sap.com/products/technology-platform/trial.html)
of the SAP Business Technology Platform (SAP BTP). 
A detailed description on how to set up an ABAP development environment on the SAP BTP is given in the learning journey
[Getting Started with ABAP Programming on SAP BTP](https://learning.sap.com/learning-journey/get-started-with-abap-programming-on-sap-btp).

### ABAP Programming Language

This curriculum does not provide an introduction to the ABAP programming language. There are a large number
of books, lectures, video tutorials online courses available on the ABAP programming language. The following
list contains just a few examples:

- Books

  - Franz, T., & Kühnhauser, K.-H. (2019). Einstieg in ABAP (5., aktualisierte und erweiterte Auflage). Rheinwerk.
  - Hardy, P. (2022). ABAP to the future (4th edition). Rheinwerk Publishing, Inc.

- Learning Journey

  - [Get Started with ABAP Development](https://developers.sap.com/mission.abap-dev-get-started.html)
  - [Getting Started with ABAP Programming on SAP BTP](https://learning.sap.com/learning-journey/get-started-with-abap-programming-on-sap-btp)

- Other
  - [ABAP track on exercism](https://exercism.org/tracks/abap)

This curriculum assumes a basic knowledge of the ABAP language.

### Other Technologies and Concepts

In order to follow the curriculum a basic understanding of the following technologies and concepts is required:

- [Git](https://en.wikipedia.org/wiki/Git)
- [HTML5](https://en.wikipedia.org/wiki/HTML5)
- [OData](https://www.odata.org/)
- [ReST](https://en.wikipedia.org/wiki/Representational_state_transfer) and APIs.

## Lectures

The curriculum consists of the following lessons:

1. [Hello World](./docs/hello_world.md)
1. [The ABAP RESTful Application Programming Model](./docs/abap_rap.md)
1. [Scenario Description](./docs/scenario_description.md)
1. [Creating the Data Model](./docs/data_model.md)
1. [Creating a Read-Only List Report](./docs/ro_list_report.md)
1. [Creating a Transactional App](./docs/transactional_app.md)
1. [Creating a UI using Fiori Elements](./docs/fiori_ui.md)
1. [Adding Behaviour to the App](./docs/adding_behaviour.md)
1. [Adding Fuzzy Search](./docs/common_capbilities.md)
1. [Adding Authentication & Authorization](./docs/authentication.md)

## References

- [Extend SAP S/4HANA in the cloud and on premise with ABAP based extensions](https://www.sap.com/documents/2022/10/52e0cd9b-497e-0010-bca6-c68f7e60039b.html)
- Building Extensions for SAP S/4HANA Cloud using APIs and Events
  - [Blog post](https://blogs.sap.com/2019/10/22/building-extensions-for-the-intelligent-enterprise-on-sap-cloud-platform/)
  - [YouTube Playlist](https://www.youtube.com/playlist?list=PLkzo92owKnVxiagp35AcwoxOlX0J4hLyY)
- [Develop Extensions Using SAP S/4HANA Cloud, ABAP Environment](https://learning.sap.com/learning-journey/develop-extensions-using-sap-s-4hana-cloud-abap-environment)
- [Build Apps with the ABAP RESTful Application Programming Model](https://open.sap.com/courses/cp13)
- [ABAP Cloud FAQs](https://community.sap.com/topics/abap/abap-cloud-faq)

## Acknowledgements

The work on this material has been supported by [WiLMo](https://www.dh.nrw/kooperationen/OERContent.nrw%202021-95) project.
