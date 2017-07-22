accessing
cachedSnapshotOf: aVersion ifAbsentPut: aBlock
	"Keep last four versions in most recently used order.
	Two for switching branches plus two temporary stash commits for each."
	| index |
	(cachedSnapshots ifNil: [cachedSnapshots := Array with: aVersion -> aBlock value]).
	index := cachedSnapshots findFirst: [:each | each key = aVersion].
	index == 0 ifTrue:
		[cachedSnapshots at: cachedSnapshots size put: aVersion -> aBlock value.
		index := cachedSnapshots size].
	index > 1 ifTrue:
		[(WriteStream on: (Array new: cachedSnapshots size)) in: [:stream |
			stream nextPut: (cachedSnapshots at: index).
			cachedSnapshots withIndexDo: [:each :eachIndex |
				eachIndex ~~ index ifTrue: [stream nextPut: each]].
			cachedSnapshots := stream contents]].
	self assert: cachedSnapshots first key = aVersion.
	^ cachedSnapshots first value