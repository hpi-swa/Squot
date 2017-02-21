accessing
definitions
	^ definitions ifNil: [ definitions := self loadDefinitions].