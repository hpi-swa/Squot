reflection
reflectInstanceVariable: anInstanceVariable in: anObject
	^ thisContext object: anObject instVarAt: (class instVarIndexFor: anInstanceVariable name ifAbsent: [(NotFound object: anInstanceVariable) signal])