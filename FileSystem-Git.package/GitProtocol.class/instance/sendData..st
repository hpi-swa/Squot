private
sendData: aString
	Transcript show: aString; cr; cr.
	^ self socketStream sendCommand: aString