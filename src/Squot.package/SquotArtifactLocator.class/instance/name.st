accessing
name
	^ name ifNil: [detectBlock homeMethod selector]