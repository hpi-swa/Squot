tests
testLazyArtifactsAreEvaluatedWhenAdded
	| artifactSnapshot directory fileStore |
	store add: ValueHolder new at: 'object'.
	artifactSnapshot := (store artifactAt: 'object') capture.
	store removeAt: 'object'.
	directory := FileSystem memory root.
	fileStore := SquotFileSystemStore inDirectory: directory.
	fileStore add: artifactSnapshot.
	self deny: ((fileStore artifactAt: 'object') diffAgainst: artifactSnapshot) hasChanges.
	"when"
	workingCopy addUnloaded: (fileStore artifactAt: 'object').
	directory children do: [:each | each deleteAll].
	"then"
	self deny: ((workingCopy artifactAt: 'object') diffAgainst: artifactSnapshot) hasChanges.