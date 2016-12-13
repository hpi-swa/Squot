accessing
converter
	^ converter ifNil: [converter := TextConverter default]