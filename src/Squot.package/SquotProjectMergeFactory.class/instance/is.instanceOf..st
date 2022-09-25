callbacks
is: anObject instanceOf: anotherObject
	"Irrelevant for project merges because artifacts are values."
	self flag: #todo. "Well, except for artifact path consolidation?"
	self flag: #todo. "Should sender ask mirror instead?"
	self flag: #todo. "When this is called because the incoming project or the working copy has an artifact removed, actually compare the artifact metadata and graphs! Handle in removed:at: and added:at: instead?"
	^ true