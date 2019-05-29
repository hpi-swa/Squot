loading and unloading
temporarilySaveChangesDuring: aBlock
	"Create a temporary version that saves all unsaved changes on the lastLoadedHistorian,
	perform aBlock and go back to the original historian without the temp version."
	| previousLoadedVersion tempVersion |
	previousLoadedVersion := self loadedVersion.
	[self withCurrentSnapshot:
		[tempVersion := SquotInMemoryVersion new
							snapshot: self currentSnapshot;
							parents: self parentVersions;
							yourself.
		self loadedVersion: tempVersion.
		aBlock value]]

		ensure:
			[self loadedVersion: previousLoadedVersion].