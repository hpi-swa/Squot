copying
copySlotOverrides: anIdentityDictionary
	"Copy the inner dictionaries."
	| copy |
	copy := anIdentityDictionary copy.
	copy associationsDo: [:each | each value: each value copy].
	^ copy