comparing
= other
	self == other ifTrue: [^ true].
	[^ self = other copiedFrom or: [other = self copiedFrom]]
		on: MessageNotUnderstood do: [^ false]