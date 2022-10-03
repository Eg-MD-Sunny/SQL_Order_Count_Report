select cast(dbo.toBdt(s.ReconciledOn) as date) [Date],
       o.Id [OrderID], 
       count(o.Id) [Total Order],
	   pv.Id [PVID],
	   pv.Name [Product]

from ThingRequest tr
join Shipment s on s.Id = tr.ShipmentId 
join [Order] o on o.Id = s.OrderId 
join ProductVariant pv on pv.Id = tr.ProductVariantId 

where s.ReconciledOn is not null 
and s.ReconciledOn >= '2022-01-01 00:00 +06:00'
and s.ReconciledOn < '2022-01-07 00:00 +06:00'
and tr.IsCancelled = 0
and tr.IsMissingAfterDispatch = 0
and tr.HasFailedBeforeDispatch = 0
and tr.IsReturned = 0
and s.ShipmentStatus not in (1,5,9)
and pv.Id in (7601)

group by o.Id,
         pv.Id,
	     pv.Name,
		 cast(dbo.toBdt(s.ReconciledOn) as date)
