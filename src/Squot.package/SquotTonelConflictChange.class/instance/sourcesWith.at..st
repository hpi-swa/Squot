accessing
sourcesWith: aString at: aNumber
	^ (self texts collect: #asString)
		at: aNumber put: aString;
		yourself