# Next Steps

After finishing the [previous unit](adding_behavior.md) the [rating app](scenario_description.md) is
not finished, yet. This unit describes possible next steps for the rating app as well as further reading
regarding SAP RAP.

## Improving the Rating App

With the knowledge from this curriculum, there are still many improvements possible for the rating app.
The following list contains just a few of them.

- **Implement the customer part of the Rating App**:
  Currently, only the app to manage product ratings is implemented. The app for customers to
  add ratings is still missing. This app should allow customers to provide a rating. Possible by
  only allowing changes to the rating and review fields. This functionality could be achieved by:

  - Creating a projection of the business objects
  - Creating a specific behavior projection
  - Creating the necessary service definition and binding.

- **Improve the UI**:
  Numerous usability improvements are possible for the app. For example

## Deploying the Rating App

So far we did not implement the SAP Fiori part of the app. Instead, only the preview feature of the
service binding was used. In order to deploy the app into e.g. a [Fiori Launchpad](https://experience.sap.com/fiori-design-web/launchpad/)
it would be necessary to implement a _real_ SAP Fiori app on the basis of the developed services. The
necessary steps to create a Fiori app on the basis of the SAP ABAP RAP service are
described in [this tutorial](https://developers.sap.com/tutorials/fiori-tools-rap-create-application.html).

Besides that, the app currently misses any authorization and authentication. Adding an authorization model
to an SAP ABAP RAP application is described in [this tutorial](https://developers.sap.com/group.abap-env-authorizations.html).

## Advanced RAP Topic

The tutorial in the [SAP BTP ABAP Environment: Intermediate Topics](https://developers.sap.com/mission.abap-env-intermediate.html)
cover a wide variety of more advanced topics. For example, there are tutorials on writing unit tests for SAP ABAP RAP
development objects.

Another interesting tool is the [RAP generator](https://github.com/SAP-samples/cloud-abap-rap). This open-source tool
can be used to quickly generate an SAP ABAP RAP application. The idea underlying the RAP generator is:

> to ease the life of the developer since it helps you to create most of the boilerplate coding that
> is needed to implement a RAP business object using the ABAP RESTful Application Programming Model (RAP)
> so that you as a developer can start more quickly to implement the business logic.

### Unmanaged and Draft

Besides creating business objects from scratch, the SAP ABAP RAP framework provides functionality to
wrap existing business logic. This is useful, for example, to create existing custom development
into a new application. The approach is described in the
[Developed Unmanaged Transaction Apps](https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/f6cb3e3402694f5585068e5e5161a7c1.html)
section of the documentation.

SAP ABAP RAP also provides functionality for draft handling. This is described in the
[Developing Transactional Apps with Draft Capabilities](https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/71ba2bec1d0d4f22bc344bba6b569f2e.html)
section of the documentation.

## Summary

The links above should provide enough content to get started with developing business applications
using the SAP ABAP RAP framework.

**Happy RAPping** 🎤!

---

[< Previous Chapter](./transactional_app.md) | [Overview 🏠](../README.md)
