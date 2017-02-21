as yet unclassified
testTemporaryAssignment
	| previousValues tempStamp finalValues |
	previousValues := Array
		with: ([GitStamp defaultName] on: GitStampNameRequest do: [:r | r return: nil])
		with: ([GitStamp defaultEmail] on: GitStampEmailRequest do: [:r | r return: nil]).
	tempStamp := TemporaryGitStamp ensureDefaultValues.
	self deny: GitStamp defaultName isNil.
	self deny: GitStamp defaultEmail isNil.
	tempStamp restorePreviousValues.
	finalValues := Array
		with: ([GitStamp defaultName] on: GitStampNameRequest do: [:r | r return: nil])
		with: ([GitStamp defaultEmail] on: GitStampEmailRequest do: [:r | r return: nil]).
	self assert: previousValues equals: finalValues.