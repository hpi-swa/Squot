applying
revertMerge
	"Revert the changes loaded during the merge."
	"Uses the snapshot previously captured in prepareMerge"
	SquotToggles useNewApi ifTrue:
		[self notYetImplemented. "Must use the merge, not a patch."
		^ self].
	loadedPatch artifacts do:
		[:each | workingCopy loadArtifact: (self workingCopySnapshot artifactAt: each path)].
	workingCopy resetNewVersionMessage.