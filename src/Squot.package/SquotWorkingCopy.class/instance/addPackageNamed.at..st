*Squot-Packages
addPackageNamed: packageName at: path
	| package validatedPath serializer tempArtifact addedArtifact |
	"Use same format as existing package(s)."
	serializer := self packageSerializer ifNil: [SquotPackageShadow squotPreferredSerializer name].
	package := PackageInfo named: packageName.
	tempArtifact := SquotArtifact new.
	tempArtifact
		path: path;
		initializeDefaultStoreInfoFor: package;
		serializer: (self environment valueOf: serializer);
		content: (store capture: package withMetadata: tempArtifact storeInfo).
	validatedPath := self validatePath: path for: tempArtifact.
	store add: package at: validatedPath.
	self appendToLoadOrder: validatedPath.
	addedArtifact := store artifactAt: validatedPath.
	addedArtifact serializer: (self environment valueOf: serializer).
	^ addedArtifact