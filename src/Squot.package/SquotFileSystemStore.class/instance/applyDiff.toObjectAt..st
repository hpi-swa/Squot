patching
applyDiff: aDiff toObjectAt: path
	| reference |
	reference := directory resolve: path.
	reference exists ifFalse: [self error: 'Attempt to patch non-existent files'].
	^ self patchOrdinary: aDiff