accessing
objectNamed: aName
	| object |
	object := objects at: aName.
	object ifNil: [^ (KeyNotFound key: aName) signal].
	^ object