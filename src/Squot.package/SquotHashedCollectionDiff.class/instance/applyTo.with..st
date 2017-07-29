patching
applyTo: aDictionaryShadow with: aPatcher
	super applyTo: aDictionaryShadow with: aPatcher.
	itemChanges associationsDo: [:each |
		each applyTo: aDictionaryShadow with: aPatcher].
	^ aDictionaryShadow