*Squot-Packages
addPackage: aPackageInfo at: path
	| existingPackage serializer storeInfo artifact |
	"Use same format as existing package(s)."
	existingPackage := self anyPackageOrNil.
	existingPackage
		ifNil: [serializer := SquotPackageShadow squotPreferredSerializer name]
		ifNotNil: [serializer := existingPackage storeInfo serializer].
	storeInfo := SquotTrackedObjectMetadata new
		id: SquotArtifact newId;
		at: #path put: path;
		at: #packageName put: aPackageInfo packageName; "required in copySettingsFrom:to: below"
		serializer: (self environment valueOf: serializer);
		yourself.
	existingPackage ifNotNil:
		[store copySettingsFrom: existingPackage to: storeInfo.
		repository copySettingsFrom: existingPackage to: storeInfo].
	aPackageInfo squotInitializeStoreInfo: storeInfo. "Instead of SquotArtifact initializeDefaultStoreInfoFor: packageInfo"
	artifact := self add: aPackageInfo withStoreInfo: storeInfo.
	artifact liveStoreInfo removeKey: #packageName. "for now..."
	^ artifact