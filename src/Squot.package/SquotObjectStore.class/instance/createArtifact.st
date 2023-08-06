accessing artifacts
createArtifact
	"Create a new SquotArtifact for something that is stored in this store. Initialize the properties suitably for this store, but let the sender the freedom of further modification. Answer the new artifact."
	^ self subclassResponsibility