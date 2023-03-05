accessing
addPackage
	| packageName packageInfo |
	packageName := classFactory packageName.
	packageInfo := PackageInfo named: packageName.
	SquotToggles useNewApi
		ifTrue:
			[| storeInfo artifact |
			storeInfo := SquotTrackedObjectMetadata withNewId
				at: 'path' put: packageName, '.package';
				at: 'references' put: (Array
					with: 'package_', packageName -> (OrderedDictionary newFrom:
						{'type' -> 'package'.
						'packageName' -> packageName.
						'content-type' -> SquotCypressCodeSerializer contentType}));
				at: #objectClassName put: #PackageInfo;
				at: #serializer put: (SquotCypressCodeSerializer flag: #stub; name);
				yourself.
			repository initializeStoreInfo: storeInfo forObject: nil.
			artifact := SquotArtifact storeInfo: storeInfo.
			workingCopy putArtifact: artifact]
		ifFalse:
			[workingCopy add: packageInfo at: packageInfo name, '.package'].
	^ packageInfo