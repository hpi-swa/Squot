configuration
configAt: aNameString ifAbsent: aBlock
	| key sectionHead subNames sectionName |
	self ensureConfigOr: [^ aBlock value].
	subNames := aNameString splitBy: '.'.
	self assert: (aNameString includes: $.) description: 'config key must include section'.
	sectionHead := subNames first.
	key := subNames last.
	sectionName := subNames size = 2 ifTrue: [sectionHead]
		ifFalse: [sectionHead, ' "', (aNameString copyFrom: sectionHead size  + 2 to: aNameString size - key size  - 1), '"'].
	^ config section: sectionName at: key ifAbsent: aBlock