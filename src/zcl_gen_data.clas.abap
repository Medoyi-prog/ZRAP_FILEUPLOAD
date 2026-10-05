CLASS zcl_gen_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gen_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA LWA_equity TYPE ztbl_equity_me.
    DATA lit_equity TYPE STANDARD TABLE OF ztbl_equity_me.

  TRY.
        lwa_equity-equity_id   = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    LWA_equity-equity_name = 'SJVN'.
    LWA_equity-total_qty   = 100.
    "APPEND lwa_equity to lit_equity.
    "INSERT lwa_equity into ztbl_equity_me.

   " INSERT ztbl_equity_me FROM TABLE @lit_equity.

    "DATA LIT_TABLE TYPE STANDARD TABLE OF DB_TABLE.

    TRY.
        data(lv_uuid) = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    lit_equity = VALUE #(
      ( equity_id = lv_uuid equity_name = 'IDFC First Bank' total_qty   = 100 )
    "  ( user_id = 'U03' email = 'sam@example.com' )
    ).

    " Bulk insert into database
    INSERT ztbl_equity_me FROM TABLE @lit_equity.

    IF sy-subrc = 0.
      COMMIT WORK.
    ENDIF.

    out->write( 'Demo Data has been generated for ZTBL_EQUITY_ME' ).
  ENDMETHOD.

ENDCLASS.
