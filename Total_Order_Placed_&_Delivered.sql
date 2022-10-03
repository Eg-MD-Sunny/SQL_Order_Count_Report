---Order Placed/Delivered

Select Count(*) [Total Order Count] 

from Shipment S 
join ThingRequest tr on tr.ShipmentId=s.id
Join ProductVariant PV On PV.Id=tr.ProductVariantId

where ReconciledOn is not null
and ReconciledOn >= '2022-02-01 00:00 +06:00' 
and ReconciledOn < '2022-02-02 00:00 +06:00' 
and ProductVariantId in (7601)
and warehouseid=1