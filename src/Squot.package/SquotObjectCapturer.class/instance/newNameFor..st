private
newNameFor: aDecoratedObject
	^ aDecoratedObject creator
		ifNil: [self rootName]
		ifNotNil: [:creator | (objectGraph nameOf: creator undecorated) ,
							{aDecoratedObject creatorSlot newNameFragment.
							UUID new}]