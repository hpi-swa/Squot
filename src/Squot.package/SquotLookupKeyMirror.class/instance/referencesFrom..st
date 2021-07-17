enumerating
referencesFrom: anObject
	"If the hash of the key is relevant, indicate this in the reference to it."
	| references |
	references := super referencesFrom: anObject.
	isKeyHashRelevant ifFalse: [^ references].
	references replace:
		[:each | (each isInstanceVariable and: [each name = 'key'])
			ifTrue: [SquotKeyVariable newFrom: each]
			ifFalse: [each]].
	^ references