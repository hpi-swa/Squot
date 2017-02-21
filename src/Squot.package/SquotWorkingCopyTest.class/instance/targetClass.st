private
targetClass
	| testClassName className |
	testClassName := self class name asText asString.
	className := (testClassName endsWith: 'WorkingCopyTest')
		ifTrue: [testClassName allButLast: 'WorkingCopyTest' size]
		ifFalse: [testClassName allButLast: 'Test' size].
	^ self class environment valueOf: (className asSymbol).
