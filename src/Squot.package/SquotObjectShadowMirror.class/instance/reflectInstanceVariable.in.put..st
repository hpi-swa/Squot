reflection
reflectInstanceVariable: anInstanceVariable in: anObjectShadow put: newValue
	anObjectShadow addInstVarSlot: (SquotInstVarSlot key: anInstanceVariable name value: newValue).
	^ newValue