reflection
reflectInstanceVariable: anInstanceVariable in: anObject put: newValue
	^ thisContext object: anObject instVarAt: (class instVarIndexFor: anInstanceVariable name ifAbsent: [(NotFound object: anInstanceVariable) signal]) put: newValue