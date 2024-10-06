actions
accept
	self checkValidRemoteName ifFalse: [^ self].
	self
		accepted: true;
		close.