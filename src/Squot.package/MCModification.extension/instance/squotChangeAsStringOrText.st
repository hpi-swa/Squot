*Squot-Tools-Diffs
squotChangeAsStringOrText
	| sourceChanged |
	sourceChanged := modification source ~= obsoletion source.
	sourceChanged
		ifTrue: [^ self sourceText]
		ifFalse: [^ self summary]