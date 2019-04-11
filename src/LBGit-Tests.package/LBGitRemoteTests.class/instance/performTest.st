running
performTest 

	 [super performTest]
		on: NeedGitCredentials do: [:e | e resume: self credentials]
		on: ConnectionClosed do: [:e | 
			self remainingAttempts strictlyPositive 
				ifTrue: [self fail: e]
				ifFalse: [self retryTest]].