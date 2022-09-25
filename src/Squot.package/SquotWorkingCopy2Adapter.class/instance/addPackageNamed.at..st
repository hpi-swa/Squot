packages
addPackageNamed: nameString at: pathString
	| storeInfo |
	self flag: #stub. "Package format hardcoded to Cypress, should really detect the format from workingCopy project metadata packageFormat"
	storeInfo := SquotTrackedObjectMetadata withNewId
		at: 'path' put:
			((pathString endsWith: '.package') "This is Cypress-specific"
				ifTrue: [pathString]
				ifFalse: [pathString, '/', nameString, '.package']);
		at: 'references' put: (Array
			with: 'package_', nameString -> (Dictionary newFrom:
				{'type' -> 'package'.
				'packageName' -> nameString.
				'content-type' -> SquotCypressCodeSerializer contentType}));
		at: #objectClassName put: #PackageInfo;
		at: #serializer put: (SquotCypressCodeSerializer flag: #stub; name);
		yourself.
	workingCopy repository initializeStoreInfo: storeInfo forObject: (nil flag: #stub; yourself).
	^ workingCopy putArtifact: (SquotArtifact storeInfo: storeInfo)