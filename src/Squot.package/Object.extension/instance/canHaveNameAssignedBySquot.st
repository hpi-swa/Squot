*Squot-shadow-capturing
canHaveNameAssignedBySquot
	"All objects except the most trivial ones can get a name, even if they don't usually need 
	one. This is used to assert that trivial objects really don't get names assigned."
	^ self class isImmediateClass not