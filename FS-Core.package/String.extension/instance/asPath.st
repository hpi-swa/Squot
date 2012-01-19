*fs-core-converting
asPath
	"convert myself to a path"
	"Examples:
		'~/Desktop' asPath
		'/home/foo' asPath
		'../../foo.bar' asPath"
	^ FSFilesystem disk resolve: self