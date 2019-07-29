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
	tool := SquotChangedArtifactsChooser on: aMerge.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool controllerForIgnores: self.
	tool requestSelectedChangesWithTitle: aString.
	^ tool accepted
		ifTrue: [aMerge resolvedPatch: tool selectedPatch]
		ifFalse: [aBlock value]