compatibility
at: aHash put: aGitStorableObject
	| object |
	self flag: #compatibility. "Only used during transition from Dictionary. Remove when no longer needed"
	object := self at: aHash ifAbsentPut: [aGitStorableObject].
	self assert: object = aGitStorableObject.
	^ aGitStorableObject