Select 
      [TypeVehicleID]
	  ,TV.[Name]
	  ,TV.[MaxWeight]
	  ,TV.[Description]
      ,[GrossWeight]
      ,[TareWeight]
from dbo.Weighings Wei
JOIN 
    dbo.TypeVehicle TV ON Wei.TypeVehicleID = TV.TypeID