private
follow: aDecoratedObject
	objectNameMapping at: aDecoratedObject undecorated
		ifPresent: [:name | state == #enumerating ifTrue: [^ self] "already followed this"]
		ifAbsentPut: [aDecoratedObject creator
					ifNil: [#()]
					ifNotNil: [:creator | (objectNameMapping at: creator undecorated) ,
										{aDecoratedObject creatorSlot key}]].
	self capture: aDecoratedObject.