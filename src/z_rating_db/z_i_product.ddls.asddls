@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product View'

define root view entity Z_I_Product
  as select from zproduct
  composition [0..*] of Z_I_Rating as _Rating
{
  key product_id   as ProductId,
      product_desc as ProductDescription,
      _Rating
}
