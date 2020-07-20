refs-private
reflogForReference: reference
	^ refLogs
		at: (repository reflogFileForReference: reference)
		ifAbsentPut: [repository reflogForReference: reference]