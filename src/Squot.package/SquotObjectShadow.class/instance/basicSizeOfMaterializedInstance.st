rematerializing
basicSizeOfMaterializedInstance
	^ ((self variableSlots detectMax: #index) ifNil: [^ 0]) index