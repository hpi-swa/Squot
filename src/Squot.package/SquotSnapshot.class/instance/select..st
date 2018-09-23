copying
select: aBlock
	| snapshotBuilder |
	snapshotBuilder := self species builder.
	artifacts select: aBlock thenDo: [:each | snapshotBuilder add: each].
	^ snapshotBuilder buildSnapshot