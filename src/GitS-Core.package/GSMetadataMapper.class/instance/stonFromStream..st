metadata-loading
stonFromStream: aStream
	| reader |
	reader := STON reader on: aStream.
	(reader instVarNamed: 'classes') "currently, no accessor exists"
		addAll: self legacySquotClassMappings.
	^ reader next