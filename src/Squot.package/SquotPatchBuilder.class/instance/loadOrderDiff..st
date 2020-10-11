initialize-release
loadOrderDiff: aDiffPatch
	| includedAccordingToArtifacts |
	loadOrderDiff := aDiffPatch.
	includedAccordingToArtifacts := patchedLoadOrder asSet.
	patchedLoadOrder :=
		(aDiffPatch applyTo: originalLoadOrder)
			select: [:each | includedAccordingToArtifacts includes: each].