initialize-release
initializeProject
	self project ifNil: [self project: (self list ifEmpty: [nil] ifNotEmpty: #first)].