tests
testPushFailedException
	| report |
	report := GitReceivePackStatusReport new.
	report unpackStatus: 'ok';
		error: 'This is a test error' forReference: 'refs/heads/errored';
		successForReference: 'refs/heads/master'.
	self assert: report hasErrors.
	self should:
		[[GitSmartHTTPProtocol new signalErrorFromReport: report]
			on: GitRemoteError do:
				[:e |
				self assert: report equals: e report;
					assert: (e messageText includesSubstring: 'This is a test error').
				e pass]]
		raise: GitRemoteError.