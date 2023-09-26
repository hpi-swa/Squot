toolbuilder
buildActionButton: builder label: aStringOrSelector action: aSelector state: anotherSelector
	^ builder pluggableActionButtonSpec new
		model: self;
		action: aSelector;
		label: aStringOrSelector;
		state: anotherSelector;
		yourself