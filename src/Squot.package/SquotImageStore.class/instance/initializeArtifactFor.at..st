adding and removing
initializeArtifactFor: anObject at: aPath
	"Create a new live artifact for the given object at the given path"
	| artifact metadata |
	artifact := SquotArtifact new
		path: aPath;
		initializeDefaultStoreInfoFor: anObject;
		yourself.
	metadata := artifact storeInfo.
	anObject squotAddTransientStoreInfoTo: metadata.
	artifact := (SquotLiveArtifact on: anObject at: aPath in: self)
		storeInfo: metadata;
		yourself.
	^ artifact.