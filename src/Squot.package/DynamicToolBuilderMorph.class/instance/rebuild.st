accessing
rebuild
	self removeAllMorphs.
	self toolbuilder buildAll: {self getSpec ifNil: [^ self]} in: self.