accessing
targetRef
	"Answer the name of the ref that I link to."
	self assert: self isSymbolic description: 'Not a symbolic ref'.
	^ self signature allButFirst: 'ref: ' size