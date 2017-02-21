helpers
concatenateArguments: aString andCapabilities: capabilities
	^ String
		streamContents: [ :str |
			
			str	nextPutAll: aString.
			
			str nextPut: self firstWantCapabilityListSeparator.
			
			capabilities isString
				ifTrue: [ str nextPutAll: capabilities ]
				ifFalse: [ str print: capabilities]]