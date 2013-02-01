accessing
refs
	^ refs ifNil: [ refs := self fetchRefs ]