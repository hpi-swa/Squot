converting
as: aShadowGraphSubclass
	self class == aShadowGraphSubclass ifTrue: [^ self].
	^ (aShadowGraphSubclass newFrom: self) postCopy