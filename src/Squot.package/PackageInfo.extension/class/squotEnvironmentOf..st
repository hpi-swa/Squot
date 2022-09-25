*Squot-Packages
squotEnvironmentOf: aSquotLiveArtifact
	"Look up the environment of a package artifact."
	SquotToggles useNewApi
		ifTrue: [^ (aSquotLiveArtifact workingCopy storeForArtifact: aSquotLiveArtifact) environment].
	^ self squotEnvironmentInMetadata: aSquotLiveArtifact liveStoreInfo