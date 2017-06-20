rematerializing
basicSizeOfMaterializedInstance
	^ ((self variableSlots detectMax: #key) ifNil: [^ 0]) key