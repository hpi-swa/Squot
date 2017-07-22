copying
postCopy
	super postCopy.
	self at: #slotOverrides
		ifPresent: [:slotOverrides |
			self at: #slotOverrides put: (self copySlotOverrides: slotOverrides)].
	self at: #ignoredInstanceVariables
		ifPresent: [:dictionary |
			self at: #ignoredInstanceVariables put: (self copyIgnoredInstanceVariables: dictionary)].