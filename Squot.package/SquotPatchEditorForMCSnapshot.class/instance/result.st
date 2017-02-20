as yet unclassified
result
	| patch |
	patch := mcChangeSelector instVarNamed: 'modalValue'. self flag: #hack.
	patch ifNil: [^ nil].
	^ (MCPatcher apply: patch to: original) squotWithSortedDefinitions