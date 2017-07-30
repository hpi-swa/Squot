adding
assign: name toShadow: aShadow
	self answer: name whenAskedForTheNameOf: aShadow.
	shadows at: name put: aShadow.