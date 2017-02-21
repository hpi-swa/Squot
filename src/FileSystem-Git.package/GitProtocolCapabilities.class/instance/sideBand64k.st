capabilities
sideBand64k

	"Comment see GitProtocolCapabilities >> # sideBand:"

	self disable: #'side-band'.
	^ self enable: #'side-band-64k'.