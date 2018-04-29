handling
defaultAction
	| tool |
	tool := SquotChangedArtifactsChooser on: self patch.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool controllerForIgnores: self.
	tool requestSelectedChangesWithTitle: self title.
	^ tool accepted
		ifTrue: [tool selectedPatch]
		ifFalse: [self inform: 'Cannot abort this merge. But you could choose to exclude all changes.'.
			"repeat" self defaultAction]