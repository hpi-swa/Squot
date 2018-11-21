copying
select: aBlock
	| snapshotBuilder |
	snapshotBuilder := self species builder.
	self artifactsInLoadOrderDo: [:each |
		(aBlock value: each) ifTrue: [snapshotBuilder add: each]].
	^ snapshotBuilder buildSnapshot