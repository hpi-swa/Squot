tests
testPathValidation
	"Should rewrite paths using the serializers."
	| path |
	path := repository validatePath: '' for:
		(MCSnapshot empty asSquotArtifactForPackage:
			(PackageInfo new packageName: 'Squit-Tests-DoesNotExist')).
	self assert: 'Squit-Tests-DoesNotExist.package' equals: path.
	path := repository validatePath: 'src' for:
		(MCSnapshot empty asSquotArtifactForPackage:
			(PackageInfo new packageName: 'Squit-Tests-DoesNotExist')).
	self assert: 'src/Squit-Tests-DoesNotExist.package' equals: path.
	path := repository validatePath: 'Squit-Tests-DoesNotExist.package' for:
		(MCSnapshot empty asSquotArtifactForPackage:
			(PackageInfo new packageName: 'Squit-Tests-DoesNotExist')).
	self assert: 'Squit-Tests-DoesNotExist.package' equals: path.