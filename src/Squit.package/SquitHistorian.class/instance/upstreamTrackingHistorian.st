upstream historian
upstreamTrackingHistorian
	"Answer a local historian that represents a remote historian."
	| upstreamRef trackingRef |
	upstreamRef := self upstreamHistorianName.
	self upstreamRemote fetchSpecs
		detect:
			[:each | (trackingRef := each trackingRefOf: upstreamRef) notNil]
		ifNone: [^ NotFound signal: 'Unknown version on upstream branch'].
	^ repository historianNamed: trackingRef