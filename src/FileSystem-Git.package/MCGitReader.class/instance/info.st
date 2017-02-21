accessing
info
	^ info ifNil: [ info := self loadVersionInfo ]