as yet unclassified
reinitializeHashValue
	self matchSize < 4096 ifFalse: [^ self].
	self hasher hashFirstWindowAt: self targetIndex - self hasher class window.