reflection
reflectIndexableField: anIndexableField in: anObjectShadow put: newValue
	anObjectShadow addVariablePartSlot: (SquotVariablePartSlot key: anIndexableField index value: newValue).
	^ newValue