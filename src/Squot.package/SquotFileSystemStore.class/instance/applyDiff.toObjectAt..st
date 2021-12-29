patching
applyDiff: aDiff toObjectAt: path
	| reference |
	aDiff hasChanges ifFalse: [^ self artifactAt: path].
	reference := directory resolve: path.
	reference exists ifFalse: [self error: 'Attempt to patch non-existent files'].
	^ self patchOrdinary: aDiff