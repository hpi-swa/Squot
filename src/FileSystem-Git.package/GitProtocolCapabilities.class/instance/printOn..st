printing
printOn: aStream
	capabilities 
		do: [ :capability|
			aStream nextPutAll: capability ]
		separatedBy: [ aStream nextPut: Character space].