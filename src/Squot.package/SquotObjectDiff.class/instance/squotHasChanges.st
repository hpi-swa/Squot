testing
squotHasChanges
	^ slotChanges associations anySatisfy: [:any | any squotHasChanges]