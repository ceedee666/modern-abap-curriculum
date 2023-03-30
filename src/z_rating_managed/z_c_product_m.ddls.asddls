@EndUserText.label: 'Product View for Manages Scenario'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Product',
               typeNamePlural: 'Products',
               title: { type: #STANDARD, value: 'ProductId' }} }

@Search.searchable: true

@Metadata.allowExtensions: true
define root view entity Z_C_Product_M
  as projection on Z_I_Product
{
  key ProductId,
      ProductDescription,
      
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_AVERAGE_RATING'
      @EndUserText.label: 'Average Customer Rating'
      virtual AverageRating: abap.dec( 2, 1 ),
      
      /* Associations */
      _Rating : redirected to composition child Z_C_Rating_M
}
