accessing
content
	^ shadow ifNil:
		[shadow := self objectGraph asShadowGraph]