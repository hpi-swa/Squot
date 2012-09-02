private
parseUploadPackResponse
	| null result properties|
	null := 0 asCharacter.
	result := Dictionary new.
	
	self readLines: [ :line ||split hexHash parts|
		split := null split: (line allButLast: 1) asString.
		
		properties ifNil: [
			"the first line is special containing the properties" 
			properties := $  split: split second.
			result at: #properties put: properties].
			
		parts := $  split: split first.
		hexHash := parts first.
		result at: parts second put: hexHash ].
	
	^ result