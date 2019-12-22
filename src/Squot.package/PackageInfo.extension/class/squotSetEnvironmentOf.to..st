*Squot-Packages
squotSetEnvironmentOf: aSquotLiveArtifact to: anEnvironment
	"Set the environment of a package artifact."
	^ aSquotLiveArtifact liveStoreInfo at: #environment put: anEnvironment