*Squot-trackable
squotSpecializedSerializers
	self withAllSuperclassesDo:
		[:eachClass |
		(Pragma
			allNamed: #squotSerializer:priority: 
			in: eachClass class
			sortedByArgument: 2)
			ifNotEmpty:
				[:pragmas |
				^ pragmas collect: [:each | self perform: each selector]]].
	^ #()