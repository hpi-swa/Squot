private package finding
restorePackageFrom: aFileOrDirectory
	"Answer an artifact for a package for which there is no Squot metadata."
	| artifact |
	artifact := SquotArtifact new.
	artifact path: (self pathOf: aFileOrDirectory).
	PackageInfo new squotInitializeStoreInfo: artifact storeInfo.
	self deserialize: artifact in: aFileOrDirectory.
	^ artifact