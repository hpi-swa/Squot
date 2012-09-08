public-operations
unpack
	self packFile hasIndexFile
		ifTrue: [ self unpackWithIndexFile ]
		ifFalse: [ self unpackWithoutIndexFile ]