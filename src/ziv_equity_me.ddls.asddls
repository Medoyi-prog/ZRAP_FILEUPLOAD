@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Equity Master Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZIV_EQUITY_ME
  as select from ztbl_equity_me
{
      @UI.facet: [ {
      label: 'Equity Information',
      id: 'GeneralInfo',
      purpose: #STANDARD,
      position: 10 ,
      type: #IDENTIFICATION_REFERENCE
      } ]
      @UI.identification: [ { position: 10, label: 'Equity Id' } ]
      @UI.lineItem: [{ position: 10, label: 'Equity Id' }]
      @UI.selectionField: [ { position: 10  } ]
  key equity_id             as EquityId,
      @UI.identification: [ { position: 20, label: 'Equity Name' } ]
      @UI.lineItem: [{ position: 20, label: 'Equity Name' }]
      @UI.selectionField: [ { position: 20 } ]
      equity_name           as EquityName,
      @UI.identification: [ { position: 30, label: 'Total Qty' } ]
      @UI.lineItem: [{ position: 30, label: 'Total Quantity' }]
      @UI.selectionField: [ { position: 30 } ]
      total_qty             as TotalQty,
      @UI.identification: [ { position: 40, label: 'Status' } ]
      @UI.lineItem: [{ position: 40, label: 'Status' }]
      @UI.selectionField: [ { position: 40 } ]
      status                as Status,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
