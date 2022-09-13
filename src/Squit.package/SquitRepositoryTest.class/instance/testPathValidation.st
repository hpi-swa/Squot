tests
testPathValidation
	"Should rewrite paths using the serializers."
	| storeInfo |
	storeInfo := SquotTrackedObjectMetadata new.
	storeInfo at: #path put: ''.
	squitRepository initializeStoreInfo: storeInfo forObject:
		(MCSnapshot empty asSquotArtifactForPackage:
			(PackageInfo new packageName: 'Squit-Tests-DoesNotExist')) content.
	self assert: 'Squit-Tests-DoesNotExist.package' equals: (storeInfo at: #path).
	storeInfo at: #path put: 'src'.
	squitRepository initializeStoreInfo: storeInfo forObject:
		(MCSnapshot empty asSquotArtifactForPackage:
			(PackageInfo new packageName: 'Squit-Tests-DoesNotExist')) content.
	self assert: 'src/Squit-Tests-DoesNotExist.package' equals: (storeInfo at: #path).
	storeInfo at: #path put: 'Squit-Tests-DoesNotExist.package'.
	squitRepository initializeStoreInfo: storeInfo forObject:
		(MCSnapshot empty asSquotArtifactForPackage:
			(PackageInfo new packageName: 'Squit-Tests-DoesNotExist')) content.
	self assert: 'Squit-Tests-DoesNotExist.package' equals: (storeInfo at: #path).