testing
valueIsSameAsThatOf: aReferenceInGraph
	"Answer whether the other reference and I refer to the same object (although it may be a
	different edition of it)."
	^ self valueName = aReferenceInGraph valueName