testing
testColor
	| shadowGraph |
	shadowGraph := capturer captureGraph: Color black.
	self assert: Color equals: shadowGraph startShadow originalClass;
		assert: shadowGraph startShadow slots notEmpty. "not an opaque value"