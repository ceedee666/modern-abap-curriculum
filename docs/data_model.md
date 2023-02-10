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

- `Z_RATING`: The package containing all development artifacts of the Rating App
  - `Z_RATING_DB`: The database model of the Rating App. Should be created inside the `Z_RATING` package.

After creating these packages and adding `ZLOCAL` to the favorite packages the package structure should
look similar to the following screenshot.

![Package Structure](imgs/ro_list_report/package_structure.png)

## Creating Data Elements

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
