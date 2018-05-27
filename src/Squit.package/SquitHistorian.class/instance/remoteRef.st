remote-tracking historian
remoteRef
	"Answer the ref at the remote.
	For example, the remoteRef of origin/master usually is refs/heads/master."
	| expandedRef |
	expandedRef := self expandedName.
	^ (gitRepository fetchSpecOfTrackingBranch: expandedRef) ifNotNil: [:fetchSpec |
			fetchSpec remoteBranchOf: expandedRef]