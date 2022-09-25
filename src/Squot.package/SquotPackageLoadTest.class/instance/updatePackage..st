tests
updatePackage: aSnapshot
	SquotToggles useNewApi ifTrue:
		[^ imageStore updateArtifact: (aSnapshot patchRelativeToBase: (imageStore readArtifact: aSnapshot artifact))].
	imageStore applyPatch: (aSnapshot patchRelativeToBase: imageStore).