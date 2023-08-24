*Squot-Mapper-STON
fromSton: stonReader
	| path |
	path := self new.
	stonReader parseListDo: [:each | path := path / each].
	^ path