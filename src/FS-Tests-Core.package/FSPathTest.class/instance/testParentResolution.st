tests
testParentResolution
	| base relative absolute |
	base := FSPath / 'plonk' / 'pinto'.
	relative := FSPath parent / 'griffle' / 'zonk'.
	absolute := base resolve: relative.
	self assert: absolute isAbsolute.
	self assert: (absolute at: 1) = 'plonk'.
	self assert: (absolute at: 2) = 'griffle'.
	self assert: (absolute at: 3) = 'zonk'.
