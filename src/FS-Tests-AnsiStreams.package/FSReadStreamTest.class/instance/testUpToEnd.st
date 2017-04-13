tests
testUpToEnd
	| result |
	self contents: #(1 2 3 4 5).
	result := stream upToEnd.
	self assert: result = #(1 2 3 4 5) asByteArray.
	stream reset; skip: 1.
	result := stream upToEnd.
	self assert: result = #(2 3 4 5) asByteArray.