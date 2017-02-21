accessing
client
	^ client ifNil: [client := WebClient new]