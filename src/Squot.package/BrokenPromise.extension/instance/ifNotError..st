*Squot-Tools
ifNotError: aBlock
	"Workaround for bad Promise implementation up to Squeak 5.3: value of ifRejected: blocks is not used to resolve the then-Promise, but to reject it. Also Promises in Squeak 5.3 do not take on the outcome of nested promises, they just nest the rejected promise as the error reason. Check whether the promise error is a real Error exception or whether it is a custom error reason. If it is a real Error, pass the BrokenPromise on. Otherwise evaluate the block to run business logic."
	| nested |
	nested := promise.
	[(nested isKindOf: Promise) and: [nested isRejected]] whileTrue: [nested := nested error].
	(nested isKindOf: Error)
		ifTrue: [self pass]
		ifFalse: [^ aBlock cull: nested].
	"[Promise new rejectWith: 42; wait]
		on: BrokenPromise do: [:e | e ifNotError: []]" "expected: nil"
	"[((Promise new rejectWith: 42) then: [:x|] ifRejected: [:x | nil]) wait]
		on: BrokenPromise do: [:e | e ifNotError: []]" "expected: nil"
	"[((Promise new rejectWith: 42) then: [:x|] ifRejected: [:x | x error]) wait]
		on: BrokenPromise do: [:e | e ifNotError: []]" "expected: BrokenPromise signal (Squeak Trunk) or Error error (Squeak 5.3)"
	"[((Promise new resolveWith: 42) then: [:x| x error] ifRejected: [:x |]) wait]
		on: BrokenPromise do: [:e | e ifNotError: []]" "expected: BrokenPromise signal"
	"[(((Promise new resolveWith: 42) then: [:x| x error]) ifRejected: [:x |]) wait]
		on: BrokenPromise do: [:e | e ifNotError: []]" "expected: nil"
	"[[(self future error) wait]
		on: BrokenPromise do: [:e | e ifNotError: []]] fork" "expected: BrokenPromise signal"
	"[[((self future error) then: [:x |] ifRejected: [:x| nil]) wait]
		on: BrokenPromise do: [:e | e ifNotError: []]] fork" "expected: nil"
	"[[((self future error) then: [:x |]) wait]
		on: BrokenPromise do: [:e | e ifNotError: []]] fork" "expected: BrokenPromise signal"