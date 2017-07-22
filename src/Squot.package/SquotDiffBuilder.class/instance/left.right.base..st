diffing high-level
left: leftShadow right: rightShadow base: baseShadow
	"Answer a diff that would transform leftShadow into rightShadow"
	| names |
	diffedPair ifNil: ["top invocation"
		^ self newPatchFrom: leftShadow to: rightShadow base: baseShadow].
	self rememberNameOf: leftShadow;
		rememberNameOf: rightShadow;
		rememberNameOf: baseShadow.
	^ (names := {leftShadow. rightShadow. baseShadow}
		withIndexCollect: [:each :index |
			shadowNames at: each undecorated ifAbsent: [index]]) asSet size caseOf: {
		[1] -> ["all the same, perform three-way-diff"
			leftShadow squotDiffAgainst: rightShadow withBase: baseShadow with: self].
		[2] -> ["one replaced, two the same"
			(names at: 1) = (names at: 2)
				ifTrue: ["base was different" self notYetImplemented]
				ifFalse: ["left or right was reassigned" self notYetImplemented]].
		[3] -> ["all different, conflict" self notYetImplemented]}.