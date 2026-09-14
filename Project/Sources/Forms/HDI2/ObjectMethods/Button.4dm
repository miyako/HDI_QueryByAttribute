
If (newVersion=True:C214)
	QUERY BY ATTRIBUTE:C1331([Person:1]; [Person:1]OB_Field:2; "Children[a].Name"; =; "Bob"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[a].Age"; =; "15")
Else 
	QUERY BY ATTRIBUTE:C1331([Person:1]; [Person:1]OB_Field:2; "Children[].Name"; =; "Bob"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[].Age"; =; "15")
End if 