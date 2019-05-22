actions on working copies
setPackageSerializer: aSerializerFactory
	| workingCopy packageArtifacts |
	workingCopy := self projectSelection.
	packageArtifacts := workingCopy artifacts select:
		[:each | each storeInfo objectClassName = #PackageInfo].
	packageArtifacts do: [:each | each serializer: aSerializerFactory].