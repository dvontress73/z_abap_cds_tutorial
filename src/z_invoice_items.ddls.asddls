@AbapCatalog.sqlViewName: 'Z_ITEMS_DVT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoice items'
define view z_invoice_items
  as select from sepm_sddl_so_invoice_item
{

  sepm_sddl_so_invoice_item.sales_order_invoice_key,
  header.buyer.company_name,
  sepm_sddl_so_invoice_item.currency_code,
  sepm_sddl_so_invoice_item.gross_amount,

  case header.payment_status
   when 'P' then 'X'
   else ' '
  end as payment_status,

  //* Association *//
  header

}

where
  currency_code = 'USD'
