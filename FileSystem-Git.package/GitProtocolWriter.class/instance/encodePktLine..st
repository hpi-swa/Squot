helpers
encodePktLine: data
	| dataSize |
	dataSize :=  4 "data length string" + data size.
	^ ((dataSize printStringBase: 16) asLowercase padded: #left to: 4 with: $0), data.