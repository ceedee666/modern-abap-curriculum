# Modern ABAP Curriculum

This repository contains the documentation and source code for an ABAP
curriculum developed as part of the [WiLMo](https://www.dh.nrw/kooperationen/OERContent.nrw%202021-95) project,
with a focus on modern ABAP programming in the context of [SAP S/4HANA](https://en.wikipedia.org/wiki/SAP_S/4HANA)
and the SAP Business Technology Platform (SAP BTP).

## Overview

ABAP is the proprietary
programming language developed by [SAP SE](https://www.sap.com/) and is the basis of the ERP-Software offered by SAP.
Initially introduced in 1976, ABAP has evolved over the years.
This [blog post](https://blogs.sap.com/2022/09/01/evolution-of-abap/) by [Karl Kessler](https://people.sap.com/karl.kessler)
gives a nice summary of the history of the ABAP programming language.
The aim of this curriculum is to provide an
introduction to modern ABAP programming techniques and frameworks.

### Learning Objectives

The curriculum aims to achieve the following learning objectives:

1. Enable students to compare the advantages and disadvantages of different extension
   technologies for a given requirement based on a thorough understanding of the SAP S/4HANA architecture.
1. Enable students to implement extensions to an SAP S/4HANA system using state-of-the-art
   ABAP to automate business processes not implemented in the SAP S/4HANA standard.
1. Enable students to implement extensions using the ABAP RAP framework and SAP Fiori
   Elements to enhance SAP S/4HANA using the SAP best practices.

## Prerequisites

### ABAP Development Environment

For students and lecturers at universities, different options exist for getting access to an ABAP development environment.
The [SAP University Competence Centers](https://www.sap-ucc.com/) offer ABAP development system to universities (cf. the
[product list](https://portal.ucc.ovgu.de/services-produkte_rv/produktliste/) of the [SAP UCC Magdeburg](https://portal.ucc.ovgu.de/)).
Another option is to use the [trail or free tier offerings](https://www.sap.com/products/technology-platform/trial.html)
of the SAP Business Technology Platform (SAP BTP).

### ABAP Programming Language

This curriculum assumes a basic knowledge of the ABAP programming language. There
are various resources available online for learning ABAP, such as books, lectures,
video tutorials, and online courses. The following list contains just a few examples:

- Books

  - Franz, T., & Kühnhauser, K.-H. (2019). Einstieg in ABAP (5., aktualisierte und erweiterte Auflage). Rheinwerk.
  - Hardy, P. (2022). ABAP to the future (4th edition). Rheinwerk Publishing, Inc.

- Learning Journey

  - [Get Started with ABAP Development](https://developers.sap.com/mission.abap-dev-get-started.html)
  - [Acquire Core ABAP Skills](https://learning.sap.com/learning-journey/acquire-core-abap-skills)

- Other
  - [ABAP track on exercism](https://exercism.org/tracks/abap)

### Other Technologies and Concepts

In addition to basic knowledge of the ABAP programming language, a basic understanding
of the following technologies and concepts is required to follow the curriculum:

- [Git](https://en.wikipedia.org/wiki/Git)
- [HTML5](https://en.wikipedia.org/wiki/HTML5)
- [OData](https://www.odata.org/)
- [ReST](https://en.wikipedia.org/wiki/Representational_state_transfer) and APIs.

## Curriculum

The curriculum consists of the following units:

1. [Hello World](./docs/hello_world.md)
1. [The ABAP RESTful Application Programming Model](./docs/abap_rap.md)
1. [Scenario Description](./docs/scenario_description.md)
1. [Creating the Data Model](./docs/data_model.md)
1. [Creating a Read-Only List Report](./docs/ro_list_report.md)
1. [Creating a Transactional App](./docs/transactional_app.md)
1. [Adding Behaviour to the App](./docs/adding_behavior.md)
1. [Next Steps](./docs/next_steps.md)

## References

- [Extend SAP S/4HANA in the cloud and on premise with ABAP based extensions](https://www.sap.com/documents/2022/10/52e0cd9b-497e-0010-bca6-c68f7e60039b.html)
- Building Extensions for SAP S/4HANA Cloud using APIs and Events
  - [Blog post](https://blogs.sap.com/2019/10/22/building-extensions-for-the-intelligent-enterprise-on-sap-cloud-platform/)
  - [YouTube Playlist](https://www.youtube.com/playlist?list=PLkzo92owKnVxiagp35AcwoxOlX0J4hLyY)
- SAP ABAP RESTful Application Programming Model
  - [Build an SAP Fiori App Using the ABAP RESTful Application Programming Model (RAP100)](https://developers.sap.com/group.sap-fiori-abap-rap100.html)
  - [Build Apps with the ABAP RESTful Application Programming Model](https://open.sap.com/courses/cp13)
  - [ABAP Cloud FAQs](https://community.sap.com/topics/abap/abap-cloud-faq)
  - [Modern ABAP Development with the ABAP RESTful Application Programming Model (RAP)](https://community.sap.com/topics/abap/rap)
  - [ABAP for RAP: Entity Manipulation Language (ABAP EML)](https://github.com/SAP-samples/abap-cheat-sheets/blob/main/08_EML_ABAP_for_RAP.md)

## Acknowledgements

The work on this curriculum has been supported by [WiLMo](https://www.dh.nrw/kooperationen/OERContent.nrw%202021-95) project.

Additionally I want to thank [Sören Schlegel](https://people.sap.com/sschlegel) for patiently answering all my questions
around RAP!
