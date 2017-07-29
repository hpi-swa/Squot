private
newNameFor: aDecoratedObject
	^ aDecoratedObject creator
		ifNil: [self rootName]
		ifNotNil: [:creator |
			((objectGraph nameOf: creator undecorated)
				ifNotEmpty: [:name |name allButLast]) ,
			{aDecoratedObject creatorSlot newNameFragment. UUID new}]