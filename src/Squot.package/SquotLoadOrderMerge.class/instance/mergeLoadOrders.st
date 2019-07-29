private
mergeLoadOrders
	"Stub. Attempts to merge three load orders cleanly. But if there are conflicts, it will
	guess some reasonable merged order which might as well be unreasonable."
	| merge |
	merge := Diff3 new
				diffClass: GenericDiff squotDiffClass;
				file0: baseLoadOrder;
				file1: workingLoadOrder;
				file2: incomingLoadOrder;
				mergeClean.
	self collectConflictsFrom: merge.
	self autoResolveConflicts: merge.