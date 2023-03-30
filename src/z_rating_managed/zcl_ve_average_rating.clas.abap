CLASS zcl_ve_average_rating DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ve_average_rating IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA products TYPE STANDARD TABLE OF Z_C_Product_M.
    products = CORRESPONDING #( it_original_data ).

    READ ENTITIES OF Z_C_Product_M
      ENTITY Product BY \_Rating
      FIELDS ( Rating )
      WITH CORRESPONDING #( products )
      RESULT FINAL(ratings).

    SELECT
      Product,
      AVG( rating AS DEC( 2, 1 ) ) AS average_rating
      FROM @ratings AS r
      GROUP BY Product
      INTO TABLE @DATA(average_product_ratings).

    LOOP AT products ASSIGNING FIELD-SYMBOL(<product>).
      READ TABLE average_product_ratings
        WITH KEY Product = <product>-ProductId
        INTO DATA(average_product_rating).
      IF sy-subrc = 0.
        <product>-AverageRating = average_product_rating-average_rating.
      ENDIF.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( products ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
