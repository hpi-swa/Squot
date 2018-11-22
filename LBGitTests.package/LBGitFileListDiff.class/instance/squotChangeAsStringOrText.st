as yet unclassified
squotChangeAsStringOrText

	| result |
	result := self added inject: '' into: [:total :each | total, 'added: ', each, Character cr].
	result := result, (self removed inject: '' into: [:total :each | total, 'deleted: ', each, Character cr]).
	^ result