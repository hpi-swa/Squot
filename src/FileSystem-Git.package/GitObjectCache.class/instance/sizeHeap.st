private
sizeHeap
	^ objectsSortedBySize ifNil: [objectsSortedBySize :=
			Heap sortBlock: [:a :b | a key >= b key]]