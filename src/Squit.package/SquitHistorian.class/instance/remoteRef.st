remote-tracking historian
remoteRef
	"Answer the ref at the remote.
	For example, the remoteRef of origin/master usually is refs/heads/master."
	| expandedRef |
	expandedRef := self expandedName.
	^ (gitRepository fetchSpecOfTrackingBranch: expandedRef) ifNotNil: [:fetchSpec |
			GitReference
				name: (fetchSpec remoteBranchOf: expandedRef)
				target: (self version ifNil: [GitReference zeroSignature] ifNotNil: [:v | v hexHash])]