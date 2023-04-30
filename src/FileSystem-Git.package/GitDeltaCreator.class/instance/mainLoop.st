as yet unclassified
mainLoop
	[self isAtEnd] whileFalse: [
		self
			findMatch;
			handleMatch;
			checkMaxSize.
		self isAborted ifTrue: [^ self]].