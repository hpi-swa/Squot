accessing
trackingRefOf: remoteRefString
	"Answer the remote-tracking ref corresponding to the given remote ref."
	^ self mapRef: remoteRefString
		from: self remoteRefPattern
		to: self trackingRefPattern
		ifNotMatched: [nil]