parsing
fromCurrentVersionInstVarStream: aStream
	aStream do: [:each | self instVarNamed: each key asString put: each value].