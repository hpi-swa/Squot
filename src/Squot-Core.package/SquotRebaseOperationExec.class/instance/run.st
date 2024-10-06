running
run
	| result |
	result := [Compiler evaluate: self command for: self]
				on: Error
				do: [:error | ^ self handleError: error].
	result isPromise ifTrue: [
		^ result
			then: [:x | self nextOperation]
			ifRejected: [:error | self handleError: error]].
	^ self nextOperation