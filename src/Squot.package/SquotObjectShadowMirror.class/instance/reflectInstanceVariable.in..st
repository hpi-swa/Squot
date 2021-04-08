reflection
reflectInstanceVariable: anInstanceVariable in: anObjectShadow
	^ (anObjectShadow instVarSlotNamed: anInstanceVariable name) value