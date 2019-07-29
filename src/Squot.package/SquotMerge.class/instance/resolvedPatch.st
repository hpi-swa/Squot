results
resolvedPatch
	"Answers the patch that resulted after resolving the conflicts."
	self hasConflicts ifTrue: [self notYetImplemented].
	containerConflicts do: [:each | patchBuilder addDiff: each resolution].
	self flag: #TODO. "apply resolved objectConflicts?"
	^ patchBuilder buildPatch