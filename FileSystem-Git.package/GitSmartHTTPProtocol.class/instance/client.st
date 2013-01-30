accessing
client
	^ ZnClient new
		enforceHttpSuccess: true;
		yourself