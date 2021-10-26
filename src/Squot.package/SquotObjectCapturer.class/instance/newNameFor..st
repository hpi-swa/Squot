private
newNameFor: aDecoratedObject
	self flag: #deprecated. "Use newNameFor: anObject reachedFrom: referrerObject via: aReference instead."
	^ aDecoratedObject creator
		ifNil: [self rootName]
		ifNotNil: [:creator |
			((objectGraph nameOf: creator undecorated)
				ifNotEmpty: [:name |name allButLast]) ,
			{aDecoratedObject creatorSlot newNameFragment. UUID new}]