private materializing
loadPackage: aPackageShadow from: anArtifact replacing: aPackageInfoOrClass
	(self environmentForLoadedArtifact: anArtifact) beCurrentDuring: 
		[^ aPackageShadow squotMaterializeWith: self]