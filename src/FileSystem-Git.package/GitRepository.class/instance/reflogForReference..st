accessing-references
reflogForReference: reference
	^ GitReflog on: (self reflogFileForReference: reference)