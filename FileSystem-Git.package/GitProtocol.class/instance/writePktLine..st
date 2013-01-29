accessing
writePktLine: data
	|dataSize|
	dataSize :=  4 "data length string" + data size.
	^ ((dataSize printStringBase: 16) asLowercase padLeftTo: 4 with: $0), data.