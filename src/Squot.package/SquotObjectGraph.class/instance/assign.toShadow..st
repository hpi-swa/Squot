adding
assign: name toShadow: aShadow
	shadows at: name put: aShadow.
	self answer: name whenAskedForTheNameOf: aShadow.