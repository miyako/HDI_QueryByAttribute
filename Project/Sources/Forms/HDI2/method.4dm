
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (Get menu bar reference:C979="")
			SET MENU BAR:C67(1)
		End if 
		
		DISABLE MENU ITEM:C150(Get menu bar reference:C979; 1; Current process:C322)
		
		initHDI
		
		If (ds:C1482.Person.getCount()=0)
			
			$path:=Folder:C1567(fk resources folder:K87:11).file("data.4ie").platformPath
			var $project : Text
			IMPORT DATA:C665($path; $project)
			
		End if 
		
		Form:C1466.newVersion:=True:C214
		
	: (Form event code:C388=On Page Change:K2:54)
		
		ALL RECORDS:C47([Person:1])
		
		OBJECT SET VISIBLE:C603(*; "ListBox"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "Field"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "Splitter"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "RadioButton2"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "RadioButton1"; (FORM Get current page:C276>1))
		
	: (Form event code:C388=On Unload:K2:2)
		
		ENABLE MENU ITEM:C149(Get menu bar reference:C979; 1; Current process:C322)
		
End case 

