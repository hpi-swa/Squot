applying
revertMerge
	"Revert the changes loaded during the merge."
	"Uses the snapshot previously captured in prepareMerge"
	loadedPatch artifacts do:
		[:each | self loadArtifact: (self workingCopySnapshot artifactAt: each path)].