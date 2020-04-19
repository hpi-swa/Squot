compatibility
at: aHash put: aGitStorableObject
	| object |
	self deprecated: 'Use at:ifAbsentPut: instead, there is no overwriting of objects in Git.'.
	object := self at: aHash ifAbsentPut: [aGitStorableObject].
	self assert: object = aGitStorableObject.
	^ aGitStorableObject