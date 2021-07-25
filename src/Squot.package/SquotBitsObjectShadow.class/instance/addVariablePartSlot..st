accessing
addVariablePartSlot: aVariablePartSlot
	| primitiveValue |
	primitiveValue := aVariablePartSlot value.
	value basicAt: aVariablePartSlot index put: primitiveValue value.