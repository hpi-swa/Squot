rematerializing
createMaterializedInstance
	"Answer a fresh object of the same class and with the same size as my original"
	^ capturedClass isVariable
		ifTrue: [capturedClass basicNew: self basicSizeOfMaterializedInstance]
		ifFalse: [capturedClass basicNew]