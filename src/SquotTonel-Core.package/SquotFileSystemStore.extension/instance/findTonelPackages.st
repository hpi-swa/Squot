*SquotTonel-Core-guessing
findTonelPackages
	<squotArtifactLocatorFor: #PackageInfo priority: 100>
	^ self findTonelPackageDirectories collect:
		[:eachDirectory |
			self forgeLazyArtifactAt: eachDirectory
				deserializerFactory: SquotTonelDeserializer
				serializerFactory: SquotTonelSerializer
				objectClass: PackageInfo]