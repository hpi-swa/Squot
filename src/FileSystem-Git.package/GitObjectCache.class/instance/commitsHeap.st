private
commitsHeap
	"Elements should be tuples of (unix timestamp, commit)."
	^ commitsSortedByLastAccess ifNil: [commitsSortedByLastAccess :=
			Heap sortBlock: [:a :b | a first <= b first]]