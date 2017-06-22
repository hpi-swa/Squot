accessing
nameOf: anObject ifAbsentAssign: nameBlock
	^ objectNames at: anObject ifAbsentPut: nameBlock