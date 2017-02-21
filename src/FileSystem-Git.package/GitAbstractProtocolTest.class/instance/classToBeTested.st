as yet unclassified
classToBeTested
	| className |
	className := self class name asString copyFrom: 1 to: self class name size - 4.
	^ self class environment at: className asString asSymbol