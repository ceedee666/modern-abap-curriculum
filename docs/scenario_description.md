# Scenario Description

This section describes the scenario and business process that are the
basis for this curriculum.

## Customer Rating for Products

OER Bike wants to offer its customers the possibility to provide feedback to the products. This feedback
should consist of a rating of the product from 0 to 5 and an optional description of the rating. This
is a feedback approach common to many well known e-commerce web sites. Customers should
only be allowed to rate products the ordered.

The following images shows a mock up of possible user interface for the customers.
![Customer User Interface](imgs/customer_feedback_mock.png)

In addition to that OER Bike wants to allow the product managers of the different products to review the
feedback provided by the customers. Therefore, the product managers need a different user interface.
In order to analyse the user feedback for a given product the product manager enters one of OER Bike's
products and gets a list of all the reviews provided by the customers.

The following image shows a mock up of the possible user interface for product managers.
![Product Manager User Interface](imgs/product_feedback_mock.png)

OER Bike wants to implement the described functionality as an extension to their SAP S/4HANA systems.

### Task 1

In the previous lecture you learned about different extension technologies in SAP S/4HANA.
Discuss how the functionality described above could be implemented using these technologies.
What are the advantages and disadvantages of the different approaches?

## References

- [Sales Order (A2X) Service](https://api.sap.com/api/OP_API_SALES_ORDER_SRV_0001/overview)
