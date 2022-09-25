copying
copySlotOverrides: anIdentityDictionary
	"Copy the inner dictionaries."
	| copy |
	SquotToggles useNewApi ifTrue: [self deprecated].
	copy := anIdentityDictionary copy.
	copy associationsDo: [:each | each value: each value copy].
	^ copy