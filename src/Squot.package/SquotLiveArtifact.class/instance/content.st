accessing
content
	^ shadow ifNil:
		[SquotCurrentMetadata
			value: storeInfo
			during: 
				[shadow := (store capture: object) asShadowGraph]]