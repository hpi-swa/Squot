ui
operationText
	self isInEditMode ifTrue: [^ self toString asText].
	^ SquotTextUtilities diffFrom: self fromString to: self toString