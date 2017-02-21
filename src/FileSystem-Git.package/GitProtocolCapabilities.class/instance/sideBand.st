capabilities
sideBand

	"Comment see GitProtocolCapabilities >> # sideBand:"
	
	self disable: #'side-band-64k'.
	^ self enable: #'side-band'.