as yet unclassified
hash

	^ self instanceVariableValues fold: [:total :each | total bitXor: each]