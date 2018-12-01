exceptionInstantiator
signal: signalText with: responseBody remote: aGitRemote

	^ self new
		responseBody: responseBody;
		remote: aGitRemote;
		signal: signalText