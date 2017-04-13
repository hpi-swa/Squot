private package finding
restorePackageFrom: aFileOrDirectory
	"Answer an artifact for a package for which there is no Squot metadata."
	| artifact deserializer |
	artifact := SquotArtifact new.
	artifact path: (self pathOf: aFileOrDirectory).
	deserializer := self deserializers detect: [:each |
		each canReadObjectSerializedBy: #SquotCypressCodeSerializer].
	deserializer new fillContentOf: artifact from: aFileOrDirectory.
	^ artifact