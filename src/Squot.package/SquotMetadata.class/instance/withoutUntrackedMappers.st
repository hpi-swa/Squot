untracked-mappers
withoutUntrackedMappers
	self hasUntrackedMappers ifFalse: [^ self].
	^ self copy
		mappers: self trackedMappers;
		yourself