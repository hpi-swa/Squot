accessing
content
	^ shadow ifNil:
		[SquotActiveSlotOverrides
			value: storeInfo
			during: [shadow := (store capture: object) asShadowGraph]]