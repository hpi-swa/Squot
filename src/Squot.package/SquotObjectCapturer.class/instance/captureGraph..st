capturing dispatch
captureGraph: anObject
	| previousState |
	state
		ifNotNil: [previousState := state.
			[state := nil.
			^ self capture: anObject]
			ensure: [state := previousState]]
		ifNil: [^ self capture: anObject]