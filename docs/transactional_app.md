# Creating a Transactional App

In the previous chapter a app was created to only display data.
In this chapter the focus is on creating a transactional app, i.e. an app that can be used
to create, change and delete data. To develop the transactional app the
[Managed Transaction App](https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/b5bba99612cf4637a8b72a3fc82c22d9.html)
approach is used.

## Preparations

In order to separate the transaction app nicely from the read-only list report a little bit of preparation is required.
These steps are:

1. Create a package for the transactional app
1. Create two new consumption views and the corresponding metadata extensions
1. Create a service definition and service binding for the transactional app.

The steps 2 and 3 are basically a repetition of the previous unit. Technically, this would not be necessary.
The approach is used in this curriculum to preserve results from previous units for later reference.

First, create a package with the name `Z_RATING_MANAGED` as a sub-package of the existing `Z_RATING` package.

### Create new Consumption views

Inside the new package create the consumption view `Z_C_Product_M` for the root entity `Z_I_Product`. The source
code of the consumption view is shown below. Most parts of this view are similar to what was discussed in the
previous unit. The main difference is the `_Rating : redirected to composition child Z_C_Rating_M` statement.
This statement specifies, that the association `_Rating` should not used the entity `Z_I_Rating` specified in the
`Z_I_Product` entity. Instead the assosciation should be mapped to a entity named `Z_C_Rating_M`, which is created next.

The reason for this redirection is, that different consumption views could use different projections in the associations to
cater for different usage scenarios.

```abap
@UI: {
 headerInfo: { typeName: 'Product',
               typeNamePlural: 'Products',
               title: { type: #STANDARD, value: 'ProductId' }} }

@Search.searchable: true

@Metadata.allowExtensions: true
define root view entity Z_C_Product_M
  as projection on Z_I_Product
{
  key ProductId,
      ProductDescription,
      /* Associations */
      _Rating : redirected to composition child Z_C_Rating_M
}
```

The source code for the `Z_C_Rating_M` consumption view is shown below. Again, the only difference to
the previous unit is the redirection of the `_Product` association to the `Z_C_Rating_M` consumption view.

```abap
@UI: {
 headerInfo: { typeName: 'Rating',
               typeNamePlural: 'Ratings',
               title: { type: #STANDARD, value: 'Product' } } }

@Search.searchable: true
@Metadata.allowExtensions: true
define view entity Z_C_Rating_M
  as projection on Z_I_Rating
{
  key RatingUUID,
      Product,
      Name,
      Email,
      Rating,
      Review,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Product : redirected to parent Z_C_Product_M
}
```

---

[< Previous Chapter](./ro_list_report.md) | [Next Chapter >](./adding_behaviour.md) | [Overview 🏠](../README.md)
