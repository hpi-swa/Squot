tests
testAddedArtifactsNotReadUntilLoaded
	| workingCopy patch |
	"given"
	fileStore add: (SquotImageStore new
					add: (ValueHolder new contents: #old; yourself) at: 'object';
					artifactAt: 'object').
	self assert: (fileStore directory / 'object') exists.
	"when"
	workingCopy := SquotWorkingCopy forTestInMemory.
	patch := fileStore patchRelativeToBase: workingCopy.
	"then the object file should not have been read yet"
	fileStore
		removeAt: 'object';
		add: (SquotImageStore new
				add: (ValueHolder new contents: #new; yourself) at: 'object';
				artifactAt: 'object').
	workingCopy applyPatch: patch.
	self assert: #new equals: (workingCopy objectAt: 'object') contents.