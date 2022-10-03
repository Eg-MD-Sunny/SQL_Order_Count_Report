Select sum(tr.saleprice)         [totalvalue],
       count(Distinct s.orderid) [ordercount]

from ThingRequest tr
join Shipment s on s.id=tr.ShipmentId

where ReconciledOn is not null
and ReconciledOn >= '2022-01-01 00:00 +06:00'
and  ReconciledOn < '2022-02-01 00:00 +06:00'
and tr.IsMissingAfterDispatch=0 
and IsReturned=0
and IsCancelled=0
and HasFailedBeforeDispatch=0
and ShipmentStatus not in (1,9,10)

