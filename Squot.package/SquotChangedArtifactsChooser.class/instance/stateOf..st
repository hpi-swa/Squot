ui
stateOf: each
	(self isIgnored: each) ifTrue: [^ #ignored].
	each = (self proposedOf: each) ifTrue: [^ #proposed].
	each = (self originalOf: each) ifTrue: [^ #original].
	^ #changed