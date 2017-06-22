testing
squotHasChanges
	^ (itemChanges associations anySatisfy: [:any | any squotHasChanges]) or: [super squotHasChanges]