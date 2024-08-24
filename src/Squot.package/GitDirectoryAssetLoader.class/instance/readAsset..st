accessing
readAsset: aPath
	^ ((self mapperAt: aPath) ifNil: [^ nil]) loadVersionFrom: self subFileSystem