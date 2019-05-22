*SquotTonel-Core-guessing
tonelPackageLocator
	<squotArtifactLocatorFor: #PackageInfo priority: 100>
	"Look for directories with package.st"
	^ SquotArtifactLocator new
		detectBlock: [:fileOrDirectory :search :locator |
			fileOrDirectory isDirectory
				ifTrue: [(fileOrDirectory entries
							anySatisfy: 	[:eachEntry |
											eachEntry basename = 'package.st' and:
											[eachEntry isFile]])
							ifTrue: [search addArtifact:
										(self forgeLazyArtifactAt: fileOrDirectory
											deserializerFactory: SquotTonelDeserializer
											serializerFactory: SquotTonelSerializer
											objectClass: PackageInfo)]
							ifFalse: [search visitSubdirectories: fileOrDirectory with: locator]]];
		yourself