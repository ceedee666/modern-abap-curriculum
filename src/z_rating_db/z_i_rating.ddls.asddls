@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating View'

define root view entity Z_I_Rating
  as select from zrating
  association [1..1] to Z_I_Product as _Product on $projection.Product = _Product.ProductId
{
  key rating_uuid     as RatingUUID,
      product         as Product,
      name            as Name,
      email           as Email,
      rating          as Rating,
      review          as Review,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Product
}
