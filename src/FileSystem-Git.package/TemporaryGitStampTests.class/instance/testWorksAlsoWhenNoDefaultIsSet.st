as yet unclassified
testWorksAlsoWhenNoDefaultIsSet
	| previousValues |
	previousValues := Array
		with: ([GitStamp defaultName] on: GitStampNameRequest do: [:r | r return: nil])
		with: ([GitStamp defaultEmail] on: GitStampEmailRequest do: [:r | r return: nil]).
	[	GitStamp defaultName: nil; defaultEmail: nil.
		self should: [GitStamp defaultName] raise: GitStampNameRequest.
		self should: [GitStamp defaultEmail] raise: GitStampEmailRequest.
		TemporaryGitStamp ensureDefaultValues restorePreviousValues.
		self should: [GitStamp defaultName] raise: GitStampNameRequest.
		self should: [GitStamp defaultEmail] raise: GitStampEmailRequest.
	] ensure:
		[GitStamp
			defaultName: previousValues first;
			defaultEmail: previousValues second].