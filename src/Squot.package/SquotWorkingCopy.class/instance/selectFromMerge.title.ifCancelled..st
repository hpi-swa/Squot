merging
selectFromMerge: aMerge title: aString ifCancelled: aBlock
	| mergeRequest tool |
	mergeRequest :=
		SquotMergeRequested new
			merge: aMerge;
			title: aString;
			signal;
			yourself.
	mergeRequest wasHandled ifTrue: [^ aMerge].
	tool := SquotMergeTool on: aMerge.
	tool workingCopy: self;
		"addIgnoredArtifacts: self ignoredArtifacts;"
		controllerForIgnores: self;
		requestSelectedChangesWithTitle: aString.
	^ tool accepted
		ifTrue: [aMerge]
		ifFalse: [aBlock value]