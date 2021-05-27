*&---------------------------------------------------------------------*
*& Report z_invioce_items_euro
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_use_invoiceitems_cds_view.

class lcl_main definition create private.

  public section.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO lcl_main.
    METHODS run.

  protected section.
  private section.

endclass.

class lcl_main implementation.

  method create.

    r_result = new #( ).

  endmethod.

  method run.
*    cl_salv_gui_table_ida=>create_for_cds_view(
*      EXPORTING
*        iv_cds_view_name      = 'Z_INVOICE_ITEMS'
**        io_gui_container      =
**        io_calc_field_handler =
**      RECEIVING
**        ro_alv_gui_table_ida  =
*    )->fullscreen( )->display( ).

*    CATCH cx_salv_ida_contract_violation..
*    CATCH cx_salv_db_connection.
*    CATCH cx_salv_db_table_not_supported.
*    CATCH cx_salv_ida_contract_violation.
*    CATCH cx_salv_function_not_supported.

    cl_salv_gui_table_ida=>create_for_cds_view( 'Z_Invoice_Items' )->fullscreen( )->display( ).

  endmethod.

endclass.

START-OF-SELECTION.

lcl_main=>create( )->run( ).
