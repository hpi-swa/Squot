guessing
findCypressPackages
	<squotArtifactLocatorFor: #PackageInfo priority: 100>
	^ self findCypressPackageDirectories collect:
		[:eachDirectory |
			self forgeLazyArtifactAt: eachDirectory
				deserializerFactory: SquotCypressCodeDeserializer
				serializerFactory: SquotCypressCodeSerializer
				objectClass: PackageInfo]