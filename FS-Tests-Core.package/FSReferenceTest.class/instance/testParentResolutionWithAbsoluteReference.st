tests
testParentResolutionWithAbsoluteReference
	| base relative absolute |
	base := (filesystem referenceTo: '/plonk/pinto').
	relative := (FSFilesystem inMemory referenceTo: '/griffle/zonk').
	absolute := base resolve: relative.
	self assert: absolute filesystem == relative filesystem.
	self assert: absolute isAbsolute.
	self assert: (absolute path at: 1) = 'griffle'.
	self assert: (absolute path at: 2) = 'zonk'.
	
	