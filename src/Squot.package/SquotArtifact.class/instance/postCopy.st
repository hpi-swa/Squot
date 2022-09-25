copying
postCopy
	SquotToggles useNewApi ifFalse: [self content: self content copy].
	self postCopyWithoutContent.