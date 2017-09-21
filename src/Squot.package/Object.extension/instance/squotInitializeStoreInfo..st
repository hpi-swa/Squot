*Squot-trackable
squotInitializeStoreInfo: aTrackedObjectMetadata
	"Initialize metadata about me when stored in an artifact.
	Subclasses may override to add additional properties. Do not forget to call super!"
	aTrackedObjectMetadata objectClass: self class.
	