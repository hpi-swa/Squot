paths
getUnmappedPathFrom: aPath withTitle: aString additionalOptions: aCollection
	^ self
		getUnmappedPathFrom: aPath
		withTitle: aString
		additionalOptions: aCollection
		optionIfMapped: [:mapper |
			self
				requestOptionForUnmappedPath: aPath
				mapper: mapper
				additionalOptions: aCollection]