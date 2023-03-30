CLASS lhc_rating DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF rating_status,
        new               TYPE i VALUE 10,
        customer_feedback TYPE i VALUE 20,
        completed         TYPE i VALUE 30,
      END OF rating_status.


    METHODS check_email FOR VALIDATE ON SAVE
      IMPORTING keys FOR Rating~checkEmail.
    METHODS check_rating FOR VALIDATE ON SAVE
      IMPORTING keys FOR Rating~checkRating.
    METHODS set_status_new FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Rating~setStatusNew.
    METHODS set_Status_To_Completed FOR MODIFY
      IMPORTING keys FOR ACTION Rating~setStatusToCompleted RESULT result.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Rating RESULT result.
    METHODS set_status_customer_feedback FOR DETERMINE ON MODIFY
      IMPORTING keys FOR rating~setstatuscustomerfeedback.

ENDCLASS.

CLASS lhc_rating IMPLEMENTATION.

  METHOD check_email.
    READ ENTITIES OF Z_I_Product IN LOCAL MODE
      ENTITY Rating
        FIELDS ( Email )
        WITH CORRESPONDING #( keys )
      RESULT DATA(ratings).

    DATA(email_regex) =
      cl_abap_regex=>create_pcre(
      pattern     = '^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$'
      ignore_case = abap_true ).

    LOOP AT ratings ASSIGNING FIELD-SYMBOL(<rating>).
      DATA(matcher) = email_regex->create_matcher( text = <rating>-email ).
      IF matcher->match(  ) IS INITIAL.
        APPEND VALUE #( %key = <rating>-%key ) TO failed-rating.

        APPEND VALUE #( %key = <rating>-%key
                        %msg = new_message( id      = 'ZM_RATING_M'
                                            number  = '001'
                                            v1      = <rating>-email
                                            severity = if_abap_behv_message=>severity-error )
                       %element-email = if_abap_behv=>mk-on ) TO reported-rating.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD check_rating.
    READ ENTITIES OF Z_I_Product IN LOCAL MODE
        ENTITY Rating
          FIELDS ( Rating )
          WITH CORRESPONDING #( keys )
        RESULT DATA(ratings).

    LOOP AT ratings ASSIGNING FIELD-SYMBOL(<rating>).
      IF <rating>-Rating < 0 OR <rating>-Rating > 5.
        APPEND VALUE #( %key = <rating>-%key ) TO failed-rating.

        APPEND VALUE #( %key = <rating>-%key
                        %msg = new_message( id      = 'ZM_RATING_M'
                                            number  = '002'
                                            severity = if_abap_behv_message=>severity-error )
                       %element-rating = if_abap_behv=>mk-on ) TO reported-rating.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD set_status_new.
    DATA ratings_for_update TYPE TABLE FOR UPDATE Z_I_Rating.

    READ ENTITIES OF Z_I_Product IN LOCAL MODE
     ENTITY Rating
       FIELDS ( Status )
       WITH CORRESPONDING #( keys )
     RESULT DATA(ratings).

    DELETE ratings WHERE Status IS NOT INITIAL.
    CHECK ratings IS NOT INITIAL.

    LOOP AT ratings ASSIGNING FIELD-SYMBOL(<rating>).
      APPEND VALUE #( %tky = <rating>-%tky
                      status = rating_status-new )
             TO ratings_for_update.
    ENDLOOP.

    MODIFY ENTITIES OF Z_I_Product IN LOCAL MODE
      ENTITY Rating
        UPDATE FIELDS ( Status )
        WITH ratings_for_update
      REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.

  METHOD set_status_to_completed.
    READ ENTITIES OF Z_I_Product IN LOCAL MODE
     ENTITY Rating
       FIELDS ( Status )
       WITH CORRESPONDING #( keys )
     RESULT DATA(ratings).

    MODIFY ENTITIES OF Z_I_Product IN LOCAL MODE
       ENTITY Rating
         UPDATE FIELDS ( Status )
         WITH VALUE #( FOR rating IN ratings
                       ( %tky = rating-%tky
                         status = rating_status-completed ) ).

    READ ENTITIES OF Z_I_Product IN LOCAL MODE
     ENTITY Rating
       ALL FIELDS
       WITH CORRESPONDING #( keys )
     RESULT DATA(completed_ratings).

    result = VALUE #( FOR rating IN completed_ratings ( %tky = rating-%tky
                                                        %param = rating ) ).
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD set_status_customer_feedback.
    READ ENTITIES OF Z_I_Product IN LOCAL MODE
     ENTITY Rating
       FIELDS ( Status Rating )
       WITH CORRESPONDING #( keys )
     RESULT DATA(ratings).

    DELETE ratings WHERE Rating = 0.
    CHECK ratings IS NOT INITIAL.

    MODIFY ENTITIES OF Z_I_Product IN LOCAL MODE
      ENTITY Rating
        UPDATE FIELDS ( Status )
        WITH VALUE #( for rating in ratings
                          ( %tky = rating-%tky
                            status = rating_status-customer_feedback ) )
      REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Product DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Product RESULT result.

ENDCLASS.

CLASS lhc_Product IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
