private switching historians
temporarilySaveChangesOn: aHistorian
	"Saves currently unsaved changes on another historian for temporary versions on aHistorian. Answer the resulting snapshot."
	| stashHistorian unsaved temporarySnapshot |
	stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
	SquotProgress displayStatus: 'Computing unsaved changes' during:
		[unsaved := self patchRelativeToBase: self baseSnapshot.
		temporarySnapshot := self baseSnapshot createNewBuilder
													applyPatch: unsaved;
													buildSnapshot].
	"for added safety, also save a temporary version in the repository"
	SquotProgress displayStatus: 'Saving yet-unsaved changes temporarily' during:
		[self saveChanges: unsaved on: stashHistorian
			message: 'Unsaved changes on ', aHistorian shortName].
	^ temporarySnapshot