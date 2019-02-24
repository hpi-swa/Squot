running
retryTest

	self remainingAttempts: self remainingAttempts - 1.
	5 seconds wait a Delay.
	Transcript show: 'Retrying test ', self class name, testSelector.
	self performTest.