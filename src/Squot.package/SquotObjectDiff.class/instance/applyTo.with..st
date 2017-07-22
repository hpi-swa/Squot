patching
applyTo: anObjectShadow with: aPatcher
	slotChanges associationsDo: [:slotDiff |
		slotDiff squotApplyTo: anObjectShadow with: aPatcher].