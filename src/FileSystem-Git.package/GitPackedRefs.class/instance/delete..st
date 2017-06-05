removing
delete: refName
	packedRefsFile exists ifFalse: [^ self].
	self refsDictionary removeKey: refName ifAbsent: [^ self].
	self writeToFile.