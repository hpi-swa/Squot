patching
applyTo: anObjectShadow
	slotChanges associationsDo: [:slotDiff |
		slotDiff applyTo: anObjectShadow].