comparing
= other
	self == other ifTrue: [^ true].
	[^ self path = other path and: [self = other copiedFrom or: [other = self copiedFrom]]]
		on: MessageNotUnderstood do: [^ false]