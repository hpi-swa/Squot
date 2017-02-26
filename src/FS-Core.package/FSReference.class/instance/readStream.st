streams
readStream
	"Return a FSWriteStream on myself. 
	Not this does not create a new file"
	^ filesystem readStreamOn: path