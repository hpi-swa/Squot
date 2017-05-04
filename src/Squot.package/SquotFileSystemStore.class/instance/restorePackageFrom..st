private package finding
restorePackageFrom: aFileOrDirectory
	"Answer an artifact for a package for which there is no Squot metadata."
	| artifact deserializer |
	artifact := SquotArtifact new.
	artifact path: (self pathOf: aFileOrDirectory).
	PackageInfo new squotInitializeStoreInfo: artifact storeInfo.
	self flag: #duplication. "with restoreArtifactFrom: starting from here"
	deserializer := self deserializers detect: [:each |
		each canReadObjectSerializedBy: (artifact storeInfo at: #serializer)].
	deserializer new fillContentOf: artifact from: aFileOrDirectory.
	^ artifact