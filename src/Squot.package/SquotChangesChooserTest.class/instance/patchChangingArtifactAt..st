test objects
patchChangingArtifactAt: path
	| object changed |
	object := ValueHolder new contents: 1; yourself.
	workingCopy add: object at: path.
	changed := object copy.
	changed contents: 2.
	^ (SquotImageStore new add: changed at: path; captureSnapshot)
		patchRelativeToBase:
			workingCopy