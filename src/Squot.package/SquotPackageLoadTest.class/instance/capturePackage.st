tests
capturePackage
	SquotToggles useNewApi ifTrue:
		[^ imageStore readArtifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewId
			at: 'references' put:
				{'package_', package name -> (OrderedDictionary newFrom:
					{'type' -> 'package'.
					'packageName' -> package name})};
			yourself))].
	imageStore add: package at: package name, '.package'.
	^ imageStore captureSnapshot