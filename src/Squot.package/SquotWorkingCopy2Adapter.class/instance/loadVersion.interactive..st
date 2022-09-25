loading and unloading
loadVersion: aVersion interactive: aBoolean
	| merge |
	aBoolean ifTrue: [^ self loadVersionInteractively: aVersion ifCanceled: []].
	self flag: #todo. "progress notifications"
	"Automatically add objects that are already loaded."
	aVersion snapshot project artifacts do: [:each | workingCopy addIfAlreadyLoaded: each].
	"Compute and apply differences"
	merge := aVersion snapshot patchRelativeToBase: (SquotProjectSnapshot fromStore: workingCopy).
	self applyMerge: merge.
	"Update history"
	self activeHistorian version: aVersion.