*Squot-Packages
squotEnvironmentInMetadata: trackableObjectMetdata
	"Retrieve the environment from package artifact metadata."
	^ trackableObjectMetdata at: #environment ifAbsent: [Environment current]