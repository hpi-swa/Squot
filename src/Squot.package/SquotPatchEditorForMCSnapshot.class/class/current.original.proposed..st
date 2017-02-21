instance creation
current: currentMCSnapshot original: originalMCSnapshot proposed: proposedMCSnapshot
	^ self new
		original: originalMCSnapshot;
		proposed: proposedMCSnapshot;
		current: currentMCSnapshot;
		yourself