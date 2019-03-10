guessing
cypressPackageLocator
	<squotArtifactLocatorFor: #PackageInfo priority: 100>
	"Look for *.package directories with .filetree files"
	^ SquotArtifactLocator new
		detectBlock: [:fileOrDirectory :search :locator |
			fileOrDirectory isDirectory
				ifTrue: [((fileOrDirectory basename endsWith: '.package')
							and: [fileOrDirectory entries
									anySatisfy: 	[:eachEntry |
													eachEntry basename = '.filetree' and:
													[eachEntry isFile]]])
							ifTrue: [search addArtifact:
										(self forgeLazyArtifactAt: fileOrDirectory
											deserializerFactory: SquotCypressCodeDeserializer
											serializerFactory: SquotCypressCodeSerializer
											objectClass: PackageInfo)]
							ifFalse: [search visitSubdirectories: fileOrDirectory with: locator]]];
		yourself