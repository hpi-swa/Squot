accessing
refs
	^ refs ifNil: [ refs := self uploadPack ]