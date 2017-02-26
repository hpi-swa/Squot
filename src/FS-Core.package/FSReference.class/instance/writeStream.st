streams
writeStream
	"Create the file if necessary and return an FSWriteStream on myself."
	^ filesystem writeStreamOn: path