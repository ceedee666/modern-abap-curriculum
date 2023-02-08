# The ABAP RESTful Application Programming Model

ABAP is a proprietary programming language developed by SAP AG. Its first release dates back to 1983 and the
[SAP R/2](https://en.wikipedia.org/wiki/SAP_R/2) system. Consequently, the ABAP programming language and
the corresponding programming models changed significantly during this time. This section introduces
the latest programming model for the ABAP language: the ABAP RESTful Application Programming Model (ABAP RAP).

The goal of the ABAP RAP is to provide a programming model to enable the creation of [OData](https://www.odata.org/) service.
These OData services can be used to implement SAP Fiori Applications or to provide Web APIs. The ABAP RAP consists of the
components shown in the following image.

![ABAP RAP Components](imgs/abap_rap/rap_components.drawio.png)

The data model of the application is the basis of the ABAP RAP. The data model is created using the Code Data Services (CDS).
According to the SAP Help CDS

> ... provides an infrastructure for defining and consuming semantically rich data models in SAP HANA.
>
> In particular, ABAP CDS provides a framework for defining and consuming semantic data models on the central database of the application server.

## References

- [SAP Help: ABAP RESTful Application Programming Model](https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/289477a81eec4d4e84c0302fb6835035.html?locale=en-US)
