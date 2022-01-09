*Squot-Packages
addPackageNamed: packageName at: path serializer: aSerializerClass
	| package validatedPath tempArtifact addedArtifact |
	"Use same format as existing package(s)."
	package := PackageInfo named: packageName.
	tempArtifact := SquotArtifact new.
	tempArtifact
		path: path;
		initializeDefaultStoreInfoFor: package;
		serializer: aSerializerClass;
		content: (store capture: package withMetadata: tempArtifact storeInfo).
	validatedPath := self validatePath: path for: tempArtifact.
	store add: package at: validatedPath.
	self appendToLoadOrder: validatedPath.
	addedArtifact := store artifactAt: validatedPath.
	addedArtifact serializer: aSerializerClass.
	^ addedArtifact