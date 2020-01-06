applying
revertMerge
	"Revert the changes loaded during the merge."
	loadedPatch artifacts do:
		[:each | self loadArtifact: (self workingCopySnapshot artifactAt: each path)].