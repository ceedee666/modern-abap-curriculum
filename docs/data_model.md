# Data Model of the Rating App

The first step to develop the Rating App is to create the data model. The data model
consists of two parts. The table definitions and CDS views on the basis of these tables. The
CDS views provide additional semantic information on top of the database tables. For example,
the CDS view explicitly defines the relation of the tables (i.e. the 1:N relation between
products and ratings, cf. [scenario description](./scenario.md)).

## Creating Packages

Before stating to create any repository objects a package should be created to group
the objects. For the data model the following package structures is created inside the
package `ZLOCAL`:

- `Z_RATING`: The package containing all development artefacts of the Rating App
  - `Z_RATING_DB`: The database model of the Rating App. Should be created inside the `Z_RATING` package.

After creating these packages and adding `ZLOCAL` to the favourite packages the package structure should
look similar to the following screenshot.

![Package Structure](imgs/data_model/package_structure.png)

## Creating Data Elements

When creating the database tables in the [next step](creating-the-database-tables.md) mostly
[build in ABAP types](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abenddic_builtin_types.htm)
are used. Custom data elements are used for two reasons:

1. To define a foreign key relation between the product and the rating table.
1. Restrict the possible values of the rating for a product to the rang of 0 to 5.

The first step is to create a data element for the primary key of the product table. The data element
is called `ZE_PRODUCT_ID` and is created inside the `Z_RATING_DB` package. To create the data element
right click on the `Z_RATING_DB` and select `New > Other ABAP Repository Object`. In the dialog window
select `Data Element` and click `Next`. Enter `ZE_PRODUCT_ID` as the name and `Product ID` as the description of the
data element. Finally select a transport request and click `Finish`.

This opens a editor to define the details of the data element. Defined `ZE_PRODUCT_ID` as a
character field with the length of 10 characters as shown in the following screenshot.

![Data Element ZE_PRODUCT_ID](imgs/data_model/data_element_product_id.png)

The restriction of possible values for the rating of a product requires two steps. First a domain
with a data range is created. Using this domain the data element is defined. To define a
domain right click on the package `Z_RATING_DB` again and select `New > Other ABAP Repository Object`.
In the dialog window select `Domain` and click `Next`. Enter `ZD_RATING` as the name and
`Domain for Product Ratings` as the description of the domain. Finally select a transport request and click `Finish`.

This again opens a editor, this time for creating domains. Set the data type of the domain to `INT1` (i.e.
1-byte integer with a value range of 0 to 255). To further restrict the possible values enter the range 0 to 5
in the `Fixed Values` section as shown in the following screenshot.

![Domain ZD_RATING](imgs/data_model/domain_rating.png)

## Creating the Database Tables

The first step is the creation of the database tables. The data model for the Rating App consists
of the two tables Product and Rating.

```abap
@EndUserText.label : 'Product'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED

define table zproduct {

  key client     : abap.clnt not null;
  key product_id : ze_product_id not null;
  product_desc   : abap.char(40);

}

```

```abap
@EndUserText.label : 'Rating'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED

define table zrating {

  key client      : abap.clnt not null;
  key rating_uuid : sysuuid_x16 not null;
  @AbapCatalog.foreignKey.screenCheck : false
  product         : ze_product_id
    with foreign key [0..*,1] zproduct
      where product_id = zrating.product;
  name            : abap.char(128);
  email           : abap.char(128);
  rating          : ze_rating;
  review          : abap.string(512);
  created_by      : syuname;
  created_at      : timestampl;
  last_changed_by : syuname;
  last_changed_at : timestampl;

}

```
