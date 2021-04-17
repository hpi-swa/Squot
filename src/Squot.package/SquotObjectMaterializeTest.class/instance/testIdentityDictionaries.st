tests
testIdentityDictionaries
	| dict graph restored |
	dict := IdentityDictionary newFromPairs: {{nil}. {nil}. {nil}. {1}}.
	graph := capturer captureGraph: dict.
	restored := materializer rematerializeGraph: graph asShadowGraph.
	self assert: (restored includesAllOf: #((nil) (1)));
		assert: (restored keys allSatisfy: [:each | each = #(nil)]).