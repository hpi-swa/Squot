public
mergeLoadOrders
	"Stub. Attempts to merge three load orders cleanly. But if there are conflicts, it will
	guess some reasonable merged order which might as well be unreasonable. If the right
	side of a conflict in the load order includes only added elements that are not present
	in the left load order, then the left and the right chunk of the conflict will be
	concatenated. Otherwise, only the right side is taken... Beware!"
	| merge leftSet assumedRightOrder |
	merge := Diff3 new
				diffClass: GenericDiff squotDiffClass;
				file0: baseLoadOrder;
				file1: leftLoadOrder;
				file2: rightLoadOrder;
				mergeClean.
	leftSet := leftLoadOrder asSet.
	(merge anySatisfy: [:each | each key == #conflict and: [leftSet includesAnyOf: each value right]])
		ifTrue: [self flag: #notYetImplemented.
				Warning signal: 'Merging of load orders with conflicts is not yet implemented properly.'].
	assumedRightOrder := WriteStream
		on: (Array new: (merge
							inject: 0
							into: [:totalLength :each | totalLength +
									(each key == #conflict
										ifTrue: [(leftSet includesAnyOf: each value right)
													ifTrue: [each value right size]
													ifFalse: [each value left size + each value right size]]
										ifFalse: [each value size])])).
	merge do: [:each | each key == #conflict
						ifTrue: [(leftSet includesAnyOf: each value right)
									ifTrue: [assumedRightOrder nextPutAll: each value right]
									ifFalse: [assumedRightOrder
												nextPutAll: each value left;
												nextPutAll: each value right]]
						ifFalse: [assumedRightOrder nextPutAll: each value]].
	loadOrderPatch := GenericDiff squotDiffClass new
							file1: leftLoadOrder;
							file2: assumedRightOrder contents;
							diff.