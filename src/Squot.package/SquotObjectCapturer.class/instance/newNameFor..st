private
newNameFor: aDecoratedObject
	^ aDecoratedObject creator
		ifNil: [self rootName]
		ifNotNil: [:creator | (objectNameMapping at: creator undecorated) ,
							{aDecoratedObject creatorSlot newNameFragment}]