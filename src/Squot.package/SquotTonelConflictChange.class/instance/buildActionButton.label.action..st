toolbuilder
buildActionButton: builder label: aStringOrSelector action: aSelector
	^ builder pluggableActionButtonSpec new
		model: self;
		action: aSelector;
		label: aStringOrSelector;
		yourself