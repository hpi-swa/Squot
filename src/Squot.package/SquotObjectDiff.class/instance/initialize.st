initialize-release
initialize
	UnchangedPlaceholder ifNil: [UnchangedPlaceholder := Object new].
	slotChanges := Dictionary new.