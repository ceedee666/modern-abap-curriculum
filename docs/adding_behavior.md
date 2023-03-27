# Adding Behavior

In the [previous unit](./transactional_app.md) the first functionality was added to the business object.
In particular, it was defined which [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) are
available. In this unit the functionality of the business object is extended by adding additional behaviours.  
[Validations](https://help.sap.com/docs/btp/sap-abap-restful-application-programming-model/validations) are
implemented to check the data entered by the user. For example consider the email address of a user. A
validation can be used to check if a valid email address was entered.
[Determinations](https://help.sap.com/docs/btp/sap-abap-restful-application-programming-model/determinations)
are used to change the business object data based on trigger conditions. Finally
[actions](https://help.sap.com/docs/btp/sap-abap-restful-application-programming-model/actions) are added
to allow the user to trigger an operation on the business object.

## Extending the Data Model

Before adding additional behavior to the business object first the data model of the business object is extended.
There are two reasons for that. First, a status field will be used to show how determinations and actions are
implemented. Second, virtual elements are used extend the business object without changing the underlying data model.

### Adding a Status Field

The first step is to add a status field to the business object. This field will store the processing state of
a rating. First, a rating is in the status _New_. Once the customer provided a rating, i.e. rating value and an
optional review, the status is _Customer Review_. If the review was checked by a product manager the status
is changed to _Completed_.

#### Exercise 1

Extend the data model of the review business object. To do this perform the following steps:

1. Create a domain `ZD_STATUS` in the package `Z_RATING_DB`. The domain should allow the following values:
   | Fixed Values | Description |
   | ------------: | ----------- |
   | 0 | undefined |
   | 10 | New |
   | 20 | Customer Review |
   | 30 | Completed |
1. Create a data element `ZE_STATUS` in the package `Z_RATING_DB`. The data element should use the domain `ZD_STATUS`.
1. Add a `status` field to the `ZRATING` table after the `review` field. The field should by of type `ZE_STATUS`
1. Add the `status` field to the `Z_I_Rating` view after the `Review` field and rename it to `Status`.
1. Add the `Status` field to the `Z_C_Rating_M` view and the `Z_C_Rating_M` metadata extension. The `Status` should be
   displayed in the ratings list on a product's object page.

If you completed exercise 1 the resulting object page for a product should look similar to the following
screenshot:

![Object Page with Status Field](./imgs/adding_behavior/object_page_with_status.png)

[< Previous Chapter](./transactional_app.md) | [Next Chapter >](./next_steps.md) | [Overview 🏠](../README.md)
