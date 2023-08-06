update migration
migrateOldArtifactWithoutReferences: aTrackedObjectMetadata
	"Introduce list of references to an old artifact's metadata. Alter the argument directly."
	self subclassResponsibility.