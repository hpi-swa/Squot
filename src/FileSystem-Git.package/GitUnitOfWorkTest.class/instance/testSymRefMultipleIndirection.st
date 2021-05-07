tests
testSymRefMultipleIndirection
	| unitOfWork head |
	head := '1234567890123456789012345678901234567890'.
	unitOfWork := self unitOfWork.
	unitOfWork
		deleteRef: 'master';
		basicUpdateRef: 'refs/trunk' to: 'ref: refs/heads/master';
		basicUpdateRef: 'HEAD' to: 'ref: refs/trunk'.
	self assert: unitOfWork headRef isNil.
	unitOfWork basicUpdateRef: 'refs/heads/master' to: head.
	self assert: unitOfWork headRef = head.
	unitOfWork deleteRef: 'master'.
	self assert: unitOfWork headRef isNil.