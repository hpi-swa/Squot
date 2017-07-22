converting
pathFromString: aString
	"Use the unix convention by default, since many filesystems are based on it."
	
	^ FSPath from: aString delimiter: self delimiter