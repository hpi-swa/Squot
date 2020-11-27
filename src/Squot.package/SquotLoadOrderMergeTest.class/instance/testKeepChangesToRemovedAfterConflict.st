tests
testKeepChangesToRemovedAfterConflict
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'b' 'c') "with b changed" merge: #('c' 'a') "had b removed and a, c swapped" basedOn: #('a' 'b' 'c').
	merge chooseIncoming. "For the swap of a and c."
	"No removal gets applied because the user wants to keep b."
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('c' 'a' 'b') equals: (merge resolvedPatch applyTo: #('a' 'b' 'c')). "Assumption that b depends on a."