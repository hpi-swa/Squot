navigating
resolveReference: aReference
	^ aReference filesystem = self ifTrue:
		[workingDirectory resolvePath: aReference path]