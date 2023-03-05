*Squot-Tests
withNewIdCypressPackageNamed: packageNameString underPath: pathString
	^ self withNewId
		at: 'path' put: pathString, '/', packageNameString, '.package';
		at: 'references' put:
			{'package_', packageNameString -> (Dictionary newFrom:
					{'type' -> 'package'.
					'content-type' -> SquotCypressCodeSerializer contentType.
					'packageName' -> packageNameString})};
		"legacy"
		at: #objectClassName put: #PackageInfo;
		at: #serializer put: SquotCypressCodeSerializer name;
		yourself