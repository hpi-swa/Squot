accessing
readAssetFile: aPath
	^ ((self mapperAt: aPath) ifNil: [^ nil]) loadAssetFileFrom: self subFileSystem