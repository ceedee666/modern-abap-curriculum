@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product View'

define root view entity Z_I_Product
  as select from zproduct
  association [0..*] to Z_I_Rating as _Rating on $projection.ProductId = _Rating.Product
{
  key product_id   as ProductId,
      product_desc as ProductDescription,
      _Rating
}
