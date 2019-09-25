adding
assign: name toShadow: aShadow
	self assert: aShadow canHaveNameAssignedBySquot
		description: 'Primitive objects should not get names'.
	self answer: name whenAskedForTheNameOf: aShadow.
	shadows at: name put: aShadow.