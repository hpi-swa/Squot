exceptionInstantiator
signal: signalText with: responseBody

	^ self new
		responseBody: responseBody;
		signal: signalText