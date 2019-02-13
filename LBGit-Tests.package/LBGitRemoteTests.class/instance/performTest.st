running
performTest 

	 [super performTest]
		on: NeedGitCredentials do: [:e | e resume: self credentials]
		on: ConnectionTimedOut do: [:e | 
			self remainingAttempts strictlyPositive 
				ifTrue: [self fail: e]
				ifFalse: [self retryTest]].