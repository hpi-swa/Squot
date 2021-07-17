enumerating
referencesFrom: aCompiledCode
	| references |
	references := OrderedCollection new.
	references add: SquotCompiledCodeHeaderReference new.
	1 to: aCompiledCode numLiterals do: [:index |
		references add: (SquotCompiledCodeLiteralReference index: index)].
	aCompiledCode initialPC to: aCompiledCode basicSize do:
		[:index | references add: (SquotIndexableField index: index)].
	self flag: 'TODO: capture source code if available?'.
	^ references