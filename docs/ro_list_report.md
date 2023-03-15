# Creating a Read-Only List Report

With the data model in place the next step is to create a read-only list report.
A read-only list report enables displaying the data of the business objects using a
Fiori-App. In this unit a read-only list report is created for the `Z_C_Rating_ReadOnly` entity.
The Fiori-App is implemented using the [SAP Fiori elements](https://experience.sap.com/fiori-design-web/smart-templates/)
framework.

## The Business Service Provisioning Layer

The following figure shows the components of the ABAP RAP again.
In the figure the _Business Service Provisioning_ layer separates
the business objects from the service consumption.

![ABAP RAP Components](imgs/abap_rap/rap_components.drawio.png)

The business service provisioning layer contains two types of entities:

- Service Definition
- Service Binding.

The role of the _service definition_ is to specify which business objects of the data model
are exposed. In particular,
different service definitions can be created for the same
business object to cater for different consumption scenarios.

The _service binding_ binds a service (defined in a service definition) to a specific communication
protocol. Examples of available bindings are OData V2 and OData V4. Again, it is possible to create
different service bindings for different service definitions.

## Creating a Service Definition and a Service Binding

To create a service definition for the `Z_C_Rating_ReadOnly` entity,
right click on the entity and select `New Service Definition`.

![Creating a new service definition](./imgs/ro_list_report/create_service_def.png)

In the dialogue enter `Z_S_RATING_READONLY` as the name of the service definition and
`Service for Read-Only UI` as the description. In the next screen select a transport request and
click `Next>`. In the templates screen select the `Define Service`template and click `Finish`.

Below is the code of the service definition.

```abap
@EndUserText.label: 'Service for Read Only UI'
define service Z_S_Rating_ReadOnly {
  expose Z_C_Rating_ReadOnly;
  expose Z_C_Product_ReadOnly;
}
```

The service [exposes](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abensrvd_define_service.htm)
two entities from the data model, `Z_C_Rating_ReadOnly` and `Z_C_Product_ReadOnly`.

To create a service binding for the service definition, right click on the `Z_S_RATING_READONLY` service and
select `New Service Binding`.
In the dialogue enter `Z_B_RATING_READONLY_V2` as the name of the service definition and
`Rating Service - UI V2` as the description. As the binding type select `OData V2 - UI`. In the next screen select a transport request and
click `Finish` and activate the binding.

The resulting binding is shown in the following screenshot.

![Service Binding](./imgs/ro_list_report/service_binding.png)

Note that after creating a service binding, the service in not published, yet. This means that the
service can not be accessed. To publish the service click on the `Publish local service endpoint` link. This
generates the necessary artefacts for the service to be accessible. Once the publishing has completed active
the service again.

Publishing the service results in two changes in the service binging:

- A `Service URL` is shown in the binding
- The `Preview` button becomes active.

![Published Service Binding](./imgs/ro_list_report/service_binding_published.png)

Clicking on the `Service URL` opens the created OData service in the browser. It is now already possible
to query this service using the OData protocol.

### Exercise 1

Read the example data from the database using the OData service. Try to read rating and product data. Try to filter the
returned data e.g. only read reviews for a certain product.

### Different Service Binding Protocol Options

When creating a service binding different protocol options are available. The
[SAP documentation](https://help.sap.com/docs/btp/sap-abap-restful-application-programming-model/service-binding)
contains the following recommendations when to use which option:

> **UI service**
>
> A UI service makes it possible to add a SAP Fiori elements UI or other UI clients to the service.
> Currently, UI services are supported for OData and InA services.
>
> **Web API**
>
> A service that is exposed as Web API is used for all other use cases apart from UIs. Web APIs can be consumed by an unknown consumer via OData. Web APIs can be extended.
> Currently, Web APIs are supported for OData and SQL services.

Whether to use OData v2 or OData v4 depends also on the focus of the service. Regarding OData v4 the SAP documentation states:

> OData V4 services have a wider scope than OData V2 services. Use OData V4 wherever possible for transactional services.

However, not all features of SAP Fiori elements are available for OData v2. Therefore the OData v2 option is used in this unit.

### Previewing the Service

With the service published, it is now possible to preview the data using Fiori Elements.
The screenshot below shows the result of executing the preview for `Z_C_Rating_ReadOnly`.

![Previewing the service](./imgs/ro_list_report/preview.png)

The preview does not show any data. The reason is, that currently no definition exists which data of the
entity should be displayed and which not. In one of the subsequent steps this information is added to the CDS view
defining the entity. Until then it is possible to manually select the data to be displayed. This is done by clicking on the
gear icon. This opens the `View Settings` dialog. Here the columns to display can be selected.

![View Settings](./imgs/ro_list_report/view_settings.png)

Selecting all available columns and also sorting the table by `Product ID` results in the data being displayed as shown below.

![Preview containing all columns](./imgs/ro_list_report/preview_with_data.png)

Note that the Fiori elements app already provides a number of nice features. For example, it is possible to
resize the columns, to change the sort order and filtering by clicking on the column header or an export to MS Excel.

## Adding UI Annotations
