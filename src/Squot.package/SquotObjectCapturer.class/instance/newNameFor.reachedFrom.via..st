capturing
newNameFor: anObject reachedFrom: referrerObject via: aReference
	^ referrerObject
		ifNil: [self rootName]
		ifNotNil:
			[((objectGraph nameOf: referrerObject undecorated)
				ifNotEmpty: [:name | name allButLast]) ,
			{aReference newNameFragment. UUID new}]