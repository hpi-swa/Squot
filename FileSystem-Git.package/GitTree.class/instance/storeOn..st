storing
storeOn: aStream
	entries values sorted do: [ :entry | 
		entry storeOn: aStream ]