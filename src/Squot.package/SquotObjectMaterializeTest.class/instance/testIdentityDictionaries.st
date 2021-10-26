tests
testIdentityDictionaries
	| dict restored |
	dict := IdentityDictionary newFromPairs: {{nil}. {nil}. {nil}. {1}}.
	restored := self captureAndRestore: dict.
	self assert: (restored includesAllOf: #((nil) (1)));
		assert: (restored keys allSatisfy: [:each | each = #(nil)]).