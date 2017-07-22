accessing
cachedSnapshotOf: aVersion ifAbsentPut: aBlock
	"Keep last four versions in most recently used order.
	Two for switching branches plus two temporary stash commits for each."
	| index snapshot |
	(cachedSnapshots ifNil: [cachedSnapshots := Array with: aVersion -> aBlock value]).
	index := cachedSnapshots findFirst: [:each | each key = aVersion].
	index == 0
		ifTrue: [snapshot := aBlock value]
		ifFalse: [snapshot := (cachedSnapshots at: index) value].
	[index ~~ 1 ifTrue:
		[(LimitedWriteStream on: (Array new: 4)) in: [:stream |
			stream setLimit: 4 limitBlock: [cachedSnapshots := stream contents. ^ snapshot].
			stream nextPut: aVersion -> snapshot.
			cachedSnapshots withIndexDo: [:each :eachIndex |
				eachIndex ~~ index ifTrue: [stream nextPut: each]].
			cachedSnapshots := stream contents]]]
	ensure:
		[self assert: cachedSnapshots first key = aVersion.
		^ snapshot]