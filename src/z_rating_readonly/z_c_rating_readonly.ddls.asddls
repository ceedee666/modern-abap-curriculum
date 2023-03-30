@EndUserText.label: 'Rating view for RO UI'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Rating',
               typeNamePlural: 'Ratings' } }

@Search.searchable: true
@Metadata.allowExtensions: true
define view entity Z_C_Rating_ReadOnly
  as projection on Z_I_Rating
{
  key RatingUUID,
      Product,
      Name,
      Email,
      Rating,
      Review,
      /* Associations */
      _Product
}
