ui
objectSelection
	self objectIndex > 1 ifFalse: [^ nil].
	^ self objectList at: self objectIndex ifAbsent: [nil]