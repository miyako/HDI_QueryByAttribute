
If (Form.newVersion=True:C214)
	QUERY BY ATTRIBUTE:C1331([Person:1]; [Person:1]OB_Field:2; "Children[a].Name"; =; "Ann"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[a].Age"; =; "15"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[a].Toy[b].Name"; =; "Car"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[a].Toy[b].Color"; =; "Blue")
Else 
	QUERY BY ATTRIBUTE:C1331([Person:1]; [Person:1]OB_Field:2; "Children[].Name"; =; "Ann"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[].Age"; =; "15"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[].Toy[].Name"; =; "Car"; *)
	QUERY BY ATTRIBUTE:C1331([Person:1];  & ; [Person:1]OB_Field:2; "Children[].Toy[].Color"; =; "Blue")
End if 