copying
postCopy
	"I am copied, for example, when a SquotLiveObject is captured, and since my data must be modified in some cases, my owned collections must be copied."
	super postCopy.
	self at: #slotOverrides
		ifPresent: [:slotOverrides |
			self at: #slotOverrides put: (self copySlotOverrides: slotOverrides)].
	self at: #ignoredInstanceVariables
		ifPresent: [:dictionary |
			self at: #ignoredInstanceVariables put: (self copyIgnoredInstanceVariables: dictionary)].
	self flag: #extensibility. "Custom metadata currently has no chance to react to copying."