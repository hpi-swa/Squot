*Squot-Packages
squotSetEnvironment: anEnvironment inMetadata: trackableObjectMetdata
	"Set the environment in package artifact metadata."
	^ trackableObjectMetdata at: #environment put: anEnvironment