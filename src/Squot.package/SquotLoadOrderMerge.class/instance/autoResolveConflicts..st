private
autoResolveConflicts: merge
	"If the right side of a conflict in the load order includes only added elements that
	are not present in the left load order, then the left and the right chunk of the conflict
	will be concatenated. Otherwise, only the right side is taken... Beware!"
	| leftSet paths |
	leftSet := workingLoadOrder asSet.
	paths := OrderedCollection new.
	merge do:
		[:each |
		each key == #conflict
			ifTrue:
				[(leftSet includesAnyOf: each value right)
					ifTrue:
						[paths addAll: each value right.
						self resolveConflict: each with: [each value right]]
					ifFalse:
						[paths
							addAll: each value left;
							addAll: each value right.
						self resolveConflict: each with: [each value left, each value right]]]
			ifFalse: [paths addAll: each value]].
	loadOrderPatch := GenericDiff squotDiffClass new
							file1: workingLoadOrder;
							file2: paths;
							diff.