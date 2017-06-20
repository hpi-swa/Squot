rematerializing
createMaterializedInstance
	"Answer a fresh object of the same class and with the same size as my original"
	^ originalClass isVariable
		ifTrue: [originalClass basicNew: self basicSizeOfMaterializedInstance]
		ifFalse: [originalClass basicNew]