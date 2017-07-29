patching
applyTo: anObjectShadow with: aPatcher
	slotChanges associationsDo: [:slotDiff |
		slotDiff applyTo: anObjectShadow with: aPatcher].