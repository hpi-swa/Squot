test objects
patchChangingArtifactAt: path
	| object |
	object := ValueHolder new contents: 1; yourself.
	workingCopy add: object at: path;
		saveVersionWithMessage: 'add object'.
	object contents: 2.
	^ self workingCopySavePatch