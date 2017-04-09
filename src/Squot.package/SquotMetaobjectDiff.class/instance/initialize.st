initialize-release
initialize
	UnchangedPlaceholder ifNil: [UnchangedPlaceholder := Object new].
	changedInstVars := Dictionary new.