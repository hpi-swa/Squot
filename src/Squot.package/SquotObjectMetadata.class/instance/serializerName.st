accessing
serializerName
	| contents start |
	contents := self fileContents.
	start := (contents indexOfSubCollection: ' -> ') + 4.
	^ contents copyFrom: start to: contents size