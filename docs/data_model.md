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

When creating the database tables in the [next step](#creating-the-database-tables) mostly
[build in ABAP types](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abenddic_builtin_types.htm)
are used. Custom data elements are used for two reasons:

1. To define a foreign key relation between the product and the rating table.
1. Restrict the possible values of the rating for a product to the rang of 0 to 5.

The first step is to create a data element for the primary key of the product table. The data element
is called `ZE_PRODUCT_ID` and is created inside the `Z_RATING_DB` package. To create the data element
right click on the `Z_RATING_DB` and select `New > Other ABAP Repository Object`. In the dialog window
select `Data Element` and click `Next`. Enter `ZE_PRODUCT_ID` as the name and `Product ID` as the description of the
data element. Finally select a transport request and click `Finish`.

This opens a editor to define the details of the data element. Define `ZE_PRODUCT_ID` as a
character field with the length of 10 characters as shown in the following screenshot.
Finally, the changes need to be saved and activated.

![Data Element ZE_PRODUCT_ID](imgs/data_model/data_element_product_id.png)

The restriction of possible values for the rating of a product requires two steps. First a domain
with a data range is created. Using this domain the data element is defined. To define a
domain right click on the package `Z_RATING_DB` again and select `New > Other ABAP Repository Object`.
In the dialog window select `Domain` and click `Next`. Enter `ZD_RATING` as the name and
`Domain for Product Ratings` as the description of the domain. Finally select a transport request and click `Finish`.

This opens a editor, this time for creating domains. Set the data type of the domain to `INT1` (i.e.
1-byte integer with a value range of 0 to 255). To further restrict the possible values enter the range 0 to 5
in the `Fixed Values` section as shown in the following screenshot. The changes need to be saved and
activated.

![Domain ZD_RATING](imgs/data_model/domain_rating.png)

Next, the data element `ZE_RATING` needs to be created. The description is `Customer Rating`. To use the
domain created in the previous step the category `Domain` needs to be selected. As the type name `ZD_RATING`
is used. Finally, the changes need to be saved and activated again.

![Data Element ZE_RATING](imgs/data_model/data_element_rating.png)

## Creating the Database Tables

Once the data elements are created the next step is to create the database tables.
The data model for the Rating App consists of the two tables Product and Rating.

The table for products contains only the product ID and a description of the product (cf. the [scenario description](./scenario.md)).
To create the product table right click on the package `Z_RATING_DB` and select `New > Other ABAP Repository Object`.
In the dialog window select `Database Table` and click `Next`. Enter `ZPRODUCT` as the table name and
`Product` as the description of the table. Finally select a transport request and click `Finish`.
Copy the following code into the editor, save and activate the table.

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

The previous program code consist of the following elements:

- The definition of the table `ZPRODUCT` using the `define table` statement
- The `key` keyword defines the primary key of the database table. The primary key consists of
  two fields, the `client` and the `product_id`. The `client` is the unique identifier of a client
  in the SAP S/4HANA system. It is usually added as a primary key to any table unless the table should
  not be client dependent.
- The key word `not null` defines that the primary key is not allowed to be null.
- The data type of the `client` field is set to the build in type `abap.clnt`
- The data type of the `product_id` is the data element `ZE_PRODUCT_ID`
- The field `product_desc` is a character field with the length of 40 characters.

In addition some annotations (staring with the `@`) are added to the table definition. The `@EndUserText.label`
defines the short text label of the table. This will, for example, be shown in the IDE. The
`@ABAPCatalog.deliveryClass` annotation identifies the table as a table containing application data
(e.g. in contrast to customizing data). The ABAP documentation contains a detailed description of each
of the used annotations.

The rating table contains the rating of a product, a review text, the customer name and a customer address. The product
is a foreign key relation to the primary key `PRODCUT_ID` of the table `ZPRODUCT`. Additionally to those field from the scenario,
the table should also contain some management data. For each entry the user and time that created and changed the entry should be
stored. The following code snippet can be used to create the table.

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

The table created by the code snippet above consist of the following elements:

- some annotations to set the end user label, the table category and so on.
- The key consists of the `client` and the `rating_uuid` of type `sysuuid_x16`. The ID of a rating record is therefore not
  some number from a numbering scheme (as e.g. the product id) but a [universally unique identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier).
- The `product` is defined using the data element `ZE_PRODUCT_ID`. Furthermore, a foreign key relation to the table
  `ZPRODUCT` is defined. This defines that exactly 1:n relation between the entries in table `ZPRODUCT` and the entries in table `ZRATING`. The
  annotation `@AbapCatalog.foreignKey.screenCheck` is not relevant in the context of ABAP on the SAP BTP. However, it might still be added automatically
  when activating the directory object.
- The `name` and `email` fields are defined as character fields with the length of 128 characters.
- The `rating` field is defined using the data element `ZE_RATING`.
- The `review` field is a character field with the length of 512 characters.
- The `created_by` and `last_changed_by` are fields to store the user that created or change an entry. The `syuname` data type is used for this element.
- The `created_at` and `last_changed_at` fields are used to store the timestamp when the entry was created or changed. The `timestampl` data type is used for this element.

## Adding the Data to the Database

For each table in the database it is possible to show and browse the content using _Data Preview_ of the ABAP development tools.
To open the data preview either right click on the table and select `Open With > Data Preview` or simply press `<F8>` in the editor
window of the table. However, as the database tables where just created they do not contain any data yet. The next
step is to write a litters program to create some data in the tables.

The class `ZCL_GENERATE_DATA` shown below can be used to generate some data. It implements the `IF_OO_ADT_CLASSRUN` interface. This way
the class can be execute. In the `main` method the two methods `create_products` and `create_ratings` are called. Both methods
first empty the respective database table using a `DELETE FROM ...` statement. After that some dummy data is created and inserted
using a `INSERT INTO ...` statement.
Note that no `COMMIT WORK` statement is needed. The commit happens implicitly when executing the class.

```abap
CLASS zcl_generate_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
    METHODS generate_products RETURNING VALUE(r_number_of_entries) TYPE i.
    METHODS generate_ratings RETURNING VALUE(r_number_of_entries) TYPE i.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(number_of_entries) = generate_products( ).
    out->write( |{ number_of_entries } products generated successfully!| ).

    number_of_entries = generate_ratings( ).
    out->write( |{ number_of_entries } ratings generated successfully!| ).
  ENDMETHOD.


  METHOD generate_products.
    DATA products TYPE TABLE OF zproduct.
    DELETE FROM zproduct.

    products = VALUE #(
        ( product_id = |DXTR1000| product_desc = |Deluxe Touring Bike Black| )
        ( product_id = |DXTR2000| product_desc = |Deluxe Touring Bike Silver| )
        ( product_id = |DXTR3000| product_desc = |Deluxe Touring Bike Red| )
        ( product_id = |EPAD1000| product_desc = |Ellbow Pad| )
        ( product_id = |KPAD1000| product_desc = |Knee Pad| )
    ).

    INSERT zproduct FROM TABLE @products.
    RETURN sy-dbcnt.
  ENDMETHOD.

  METHOD generate_ratings.
    DATA ratings TYPE TABLE OF zrating.

    DELETE FROM zrating.

    GET TIME STAMP FIELD DATA(current_ts).

    ratings = VALUE #(
        ( rating_uuid = cl_system_uuid=>create_uuid_x16_static( )
          rating = 4
          product = |DXTR1000|
          name = |Anna Bauer|
          email = |anna@bauer.de|
          review = |The color of the bike is not very durable.|
          created_at = current_ts
          created_by = sy-uname
          last_changed_at = current_ts
          last_changed_by = sy-uname
          )
        ( rating_uuid = cl_system_uuid=>create_uuid_x16_static( )
          rating = 5
          product = |DXTR2000|
          name = |Chris Drumm|
          email = |cd@test.de|
          review = |The best bike on the market!|
          created_at = current_ts
          created_by = sy-uname
          last_changed_at = current_ts
          last_changed_by = sy-uname
          )
        ( rating_uuid = cl_system_uuid=>create_uuid_x16_static( )
          rating = 3
          product = |DXTR3000|
          name = |Eve Smith|
          email = |es@email.com|
          created_at = current_ts
          created_by = sy-uname
          last_changed_at = current_ts
          last_changed_by = sy-uname
          )
        ( rating_uuid = cl_system_uuid=>create_uuid_x16_static( )
          rating = 5
          product = |EPAD1000|
          name = |Frank Jones|
          email = |f@jones.mail|
          review = |Size varies quite a lot.|
          created_at = current_ts
          created_by = sy-uname
          last_changed_at = current_ts
          last_changed_by = sy-uname
          )
        ( rating_uuid = cl_system_uuid=>create_uuid_x16_static( )
          rating = 4
          product = |EPAD1000|
          name = |Gill Miller|
          email = |g.miller@online.com|
          created_at = current_ts
          created_by = sy-uname
          last_changed_at = current_ts
          last_changed_by = sy-uname
          )
        ( rating_uuid = cl_system_uuid=>create_uuid_x16_static( )
          rating = 5
          product = |DXTR1000|
          name = |G. Miller|
          email = |g.miller@online.com|
          created_at = current_ts
          created_by = sy-uname
          last_changed_at = current_ts
          last_changed_by = sy-uname
          )
    ).

    INSERT zrating FROM TABLE @ratings.

    RETURN sy-dbcnt.

  ENDMETHOD.

ENDCLASS.
```

Create the class `ZCL_GENERATE_DATA` in the `Z_RATING_DB` package and execute it. After executing the class the
data preview of the table `Z_RATING` should look similar to the screenshot below.

![Data Preview of the `Z_RATING` Table](img/data_model/data_preview.png)

Note that is possible to open a SQL console from the data preview. This SQL console enables the execution of
complex `SELECT` statements on the tables in the database.

![SQL Console](img/data_model/sql_console.png)
