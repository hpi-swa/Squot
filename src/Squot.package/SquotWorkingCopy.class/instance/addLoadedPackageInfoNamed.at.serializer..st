*Squot-Packages
addLoadedPackageInfoNamed: packageName at: path serializer: aSerializerClass
	"Add PackageInfo artifact and get the environment from the working copy, if it exists."
	| packageInfo storeInfo existingPackage artifact |
	packageInfo := Environment current packageOrganizer packageNamed: packageName ifAbsent: [^ self].
	(packageInfo classes isEmpty and: [packageInfo methods isEmpty]) ifTrue: [^ self].
	existingPackage := self anyPackageOrNil.
	storeInfo := SquotTrackedObjectMetadata new
		id: SquotArtifact newId;
		at: #path put: path;
		at: #packageName put: packageName; "required in copySettingsFrom:to: below"
		serializer: aSerializerClass;
		yourself.
	existingPackage ifNotNil:
		[store copySettingsFrom: existingPackage to: storeInfo.
		repository copySettingsFrom: existingPackage to: storeInfo].
	packageInfo squotInitializeStoreInfo: storeInfo. "Instead of SquotArtifact initializeDefaultStoreInfoFor: packageInfo"
	artifact := self add: packageInfo withStoreInfo: storeInfo.
	artifact liveStoreInfo removeKey: #packageName. "for now..."
	^ artifact