creating new versions
saveNewVersionFromPatch: aPatch ifCanceled: cancelBlock
	"Interactively create a new version. Let the user pick changes from aPatch."
	| selectedPatch newVersion message |
	SquotToggles enableRefactoredSave ifTrue:
		[self deprecated: 'Use newInteractiveSaveOperation instead'].
	selectedPatch := self selectFromPatch: aPatch
						forSaveWithTitle: 'Select changes and message for the new version'
						ifCanceled: [^ cancelBlock value].
	message := self newVersionMessage.
	newVersion := self
		saveNewVersionFromPatch: selectedPatch
		message: message.
	self cacheNewMonticelloVersions: selectedPatch message: message.
	self resetNewVersionMessage.
	^ newVersion