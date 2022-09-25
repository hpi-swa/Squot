capturing
newNameFor: anObject reachedFrom: referrerObject via: aReference
	| referrerName trail |
	((source notNil and: [referrerObject == source owner]) or: referrerObject isNil)
		ifTrue: [^ self rootName].
	referrerName := objectGraph nameOf: referrerObject undecorated ifAbsent: [].
	trail := referrerName
				ifNil: [{'(', referrerObject printString, ')'}]
				ifNotNil: [referrerName ifNotEmpty: [:name | name allButLast]].
	^ trail, {aReference newNameFragment. UUID new}