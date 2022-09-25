accessing artifacts
updateArtifact: anArtifactMerge
	"Update package."
	| loader patch |
	loader := MCPackageLoader new.
	anArtifactMerge graphMerge hasChanges ifFalse: [^ self].
	self flag: #todo. "Move the check for the presence of changes to a more general place?"
	patch := MCPatch operations: anArtifactMerge graphMerge mergeOfStartObject modifications.
	patch applyTo: loader.
	loader loadWithNameLike: (self packageNameOf: anArtifactMerge incoming artifact).