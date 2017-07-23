accessing
content
	content ifNil: [contentBlock value].
	content ifNotNil: [contentBlock := nil].
	^ content