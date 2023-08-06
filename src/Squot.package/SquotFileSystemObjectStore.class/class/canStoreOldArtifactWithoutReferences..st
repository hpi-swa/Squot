update migration
canStoreOldArtifactWithoutReferences: aTrackedObjectMetadata
	"Answer true if this old artifact might be suitable for this store implementation."
	^ self subclassResponsibility