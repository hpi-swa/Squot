applying
errorIncomplete: aString
	"Signal that the operation cannot be applied because some parameters have not been configured."
	^ self error: aString