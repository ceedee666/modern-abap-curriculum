# The ABAP RESTful Application Programming Model

ABAP is a proprietary programming language developed by SAP AG. Its first release dates back to 1983 and the
[SAP R/2](https://en.wikipedia.org/wiki/SAP_R/2) system. Consequently, the ABAP programming language and
the corresponding programming models changed significantly during this time. This section introduces
the latest programming model for the ABAP language: the ABAP RESTful Application Programming Model (ABAP RAP).

The goal of the ABAP RAP is to provide a programming model to enable the creation of [OData](https://www.odata.org/) service.
These OData services can be used to implement SAP Fiori Applications or to provide Web APIs. The ABAP RAP consists of the
components shown in the following image.

![ABAP RAP Components](imgs/abap_rap/rap_components.drawio.png)

The data model of the application is the basis of the ABAP RAP. The data model is created using the Core Data Services (CDS).
According to the SAP Help CDS

> ... provides an infrastructure for defining and consuming semantically rich data models in SAP HANA.
>
> In particular, ABAP CDS provides a framework for defining and consuming semantic data models on the central database of the application server.

On the basis of the data model _Business Objects_ and _Queries_ are created. Business Object is a term used to represent
any real world objects. In the context of an enterprise application this could, for example, be a customer or a sales order.
Usually these Business Objects have a structure and a behaviour. Consider as sales order in SAP S/4HANA as an example.
The sales order consists of a header and several items. The header contains general data like the sold-to party or an overall status.
The items contain, for example, the ordered products, the ordered quantities and the price. Furthermore, the sales order is
related to other business objects. The product or the sold-to party are business objects themself.
Both, a hierarchical structure and relations to other Business Objects, are common qualities of Business Objects. Therefore,
ABAP RAP provides concepts for modelling the structure and the relations of Business Objects.

Besides the structure a Business Object also has a behaviour. The behaviour defines which operations are possible for a
business object. A sales order could, for example, be created. After the creation it might be changed until it is released. Once it
is released it is only possible to chancel the whole sales order or to create a delivery for the sales order. ABAP RAP also provides
functionality for modelling and implementing the behaviour of Business Objects.

In contrast to the Business Object a Query provides read only access to the underlying data model. This access is used
for the creation of analytical reports.

Bases on the Business Objects and Queries Business Services can be provided. ABAP RAP enables the separation of the
definition of a service (i.e. which parts of a Business Object are exposed) and the Binding of a service to a particular
protocol (i.e. ODate v2 or OData V4). The Business Services are used by different consumers. A consumer of a Business Service
could be a Fiori App to enable used to work with the Business Object. For example, in SAP S/4HANA the Fiori App Manage Sales Orders
allows uses to create and monitor sales orders.

The [SAP Help: ABAP RESTful Application Programming Model](https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/289477a81eec4d4e84c0302fb6835035.html?locale=en-US)
provides further details on the different aspects of the ABAP RAP mentioned above.

## Exercise 1

Think of the product ratings customers can provide on e-commerce Web sites. What Business Objects are
can be identified? What is the structure of these Business Objects and what is their behaviour?
