loading and unloading
loadVersionInteractively: aVersion ifCanceled: aBlock
	| merge |
	aVersion snapshot project artifacts do: [:each | workingCopy addIfAlreadyLoaded: each].
	merge := aVersion snapshot patchRelativeToBase: (SquotProjectSnapshot fromStore: workingCopy).
	SquotSelectionOfChangesRequested new
		patch: merge;
		title: 'Select changes to load';
		signal.
	self notYetImplemented