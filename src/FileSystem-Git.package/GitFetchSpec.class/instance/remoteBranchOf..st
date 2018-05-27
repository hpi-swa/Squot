accessing
remoteBranchOf: remoteTrackingBranchString
	| prefix suffix branchName |
	prefix := self trackingRefPattern copyUpTo: $*.
	(remoteTrackingBranchString beginsWith: prefix) ifFalse:
		[^ self errorRemoteTrackingBranchDoesNotMatch].
	(self trackingRefPattern size == prefix size) ifTrue:
		[remoteTrackingBranchString size == prefix size
			ifTrue: [^ self remoteRefPattern]
			ifFalse: [^ self errorRemoteTrackingBranchDoesNotMatch]].
	suffix := self trackingRefPattern allButFirst: prefix size + 1. "all but prefix*"
	(suffix notEmpty and: [(remoteTrackingBranchString endsWith: suffix) not]) ifTrue:
		[^ self errorRemoteTrackingBranchDoesNotMatch].
	branchName := remoteTrackingBranchString
		copyFrom: prefix size + 1
		to: remoteTrackingBranchString size - suffix size.
	^ (prefix := self remoteRefPattern copyUpTo: $*),
		branchName,
		(self remoteRefPattern allButFirst: prefix size + 1)