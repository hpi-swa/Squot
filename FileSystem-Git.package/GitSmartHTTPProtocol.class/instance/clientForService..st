private
clientForService: aServiceName
 	^ self client
		url: self url asString, '/info/refs';
		queryAt: 'service' put: aServiceName;
		yourself
	