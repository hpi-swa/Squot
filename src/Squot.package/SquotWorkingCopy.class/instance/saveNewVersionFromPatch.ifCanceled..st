creating new versions
saveNewVersionFromPatch: aPatch ifCanceled: cancelBlock
	"Interactively create a new version. Let the user pick changes from aPatch."
	| selectedPatch tool newVersion |
	tool := SquotSaveVersionDialog new
		parentVersions: self parentVersions;
		patch: aPatch;
		controllerForIgnores: self;
		yourself.
	tool requestSelectedChangesWithTitle: 'Select changes and message for the new version'.
	tool accepted ifFalse: [^ cancelBlock value].
	selectedPatch := tool selectedPatch.
	newVersion := self
		saveNewVersionFromPatch: selectedPatch
		message: tool message asString.
	self cacheNewMonticelloVersions: selectedPatch message: tool message.
	^ newVersion