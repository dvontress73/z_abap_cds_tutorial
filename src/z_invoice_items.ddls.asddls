@AbapCatalog.sqlViewName: 'Z_ITEMS_DVT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View for "Use-cds-view" tutorial'
define view z_invoice_items
  as select from sepm_sddl_so_invoice_item
{

  sepm_sddl_so_invoice_item.sales_order_invoice_key,
  header.buyer.company_name,
  sepm_sddl_so_invoice_item.currency_code,
  sepm_sddl_so_invoice_item.gross_amount,

  @EndUserText.quickInfo: 'Paid'
  cast( case header.payment_status
   when 'P' then 'X'
   else ' '
  end
  as zso_invoice_payment_status ) as payment_status,

  //* Association *//
  header

}

where
  currency_code = 'USD'
