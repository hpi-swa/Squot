error handling
doesNotUnderstand: aMessage
	^ self change
		perform: (self indexedSelector: aMessage selector)
		withArguments: (aMessage arguments copyWith: self index)