@EndUserText.label: 'Product View for RO UI'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Product',
               typeNamePlural: 'Products' } }

@Search.searchable: true

define root view entity Z_C_Product_ReadOnly
  as projection on Z_I_Product
{

      @UI:{
        lineItem: [{
            position: 10,
            importance: #HIGH,
            type: #STANDARD,
            label: 'Product ID'
        }],
        identification: [{
            position: 10,
            label: 'Product ID'
        }]
      }
      @Search.defaultSearchElement: true
  key ProductId,

      @UI:{
        lineItem: [{
            position: 20,
            importance: #HIGH,
            type: #STANDARD,
            label: 'Product Description'
        }],
        identification: [{
            position: 20,
            label: 'Product Description'
        }]
      }
      @Search.defaultSearchElement: true
      ProductDescription,
      /* Associations */
      _Rating
}
