*Squot-shadow
asSquotArtifactForPackage: aPackageInfo path: path
	| shadow storeInfo correctedPath artifact |
	shadow := SquotShadowGraph withSingleShadow:
					(SquotPackageShadow
						forPackageNamed: aPackageInfo packageName
						withSnapshot: self).
	self flag: #duplication. "with SquotWorkingCopy adding methods"
	storeInfo := SquotTrackedObjectMetadata new.
	storeInfo
		id: SquotArtifact newId;
		at: #path put: path.
	aPackageInfo squotInitializeStoreInfo: storeInfo.
	SquotFileSystemStore initializeStoreInfo: storeInfo forObject: shadow.
	correctedPath := storeInfo removeKey: #path. "for now..."
	artifact := SquotArtifact path: correctedPath content: shadow storeInfo: storeInfo.
	^ artifact