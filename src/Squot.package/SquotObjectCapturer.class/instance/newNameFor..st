private
newNameFor: aDecoratedObject
	^ aDecoratedObject creator
		ifNil: [self rootName]
		ifNotNil: [:creator | (objectRegistry nameOf: creator undecorated) ,
							{aDecoratedObject creatorSlot newNameFragment.
							UUID new}]