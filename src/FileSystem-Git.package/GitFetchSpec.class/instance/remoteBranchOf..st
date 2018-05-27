accessing
remoteBranchOf: remoteTrackingBranchString
	"Answer the remote ref that corresponds to the given remote-tracking ref."
	^ self mapRef: remoteTrackingBranchString
		from: self trackingRefPattern
		to: self remoteRefPattern
		ifNotMatched: [nil]