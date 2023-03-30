CLASS zcl_ve_rating_age DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ve_rating_age IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA(today) = cl_abap_context_info=>get_system_date( ).

    DATA ratings TYPE STANDARD TABLE OF z_c_rating_m WITH DEFAULT KEY.
    ratings = CORRESPONDING #( it_original_data ).

    LOOP AT ratings ASSIGNING FIELD-SYMBOL(<rating>).
      CONVERT TIME STAMP <rating>-LastChangedAt
        TIME ZONE cl_abap_context_info=>get_user_time_zone( )
        INTO DATE DATA(rating_date).
      <rating>-ReviewAge = today - rating_Date.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( ratings ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
