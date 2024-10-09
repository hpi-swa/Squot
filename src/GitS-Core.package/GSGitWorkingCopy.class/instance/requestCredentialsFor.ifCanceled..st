credentials
requestCredentialsFor: aStringOrUrl ifCanceled: aBlock
	| username token |
	username := UIManager default request: ('Username for {1}:' format: {aStringOrUrl}).
	username isEmptyOrNil ifTrue: [^ aBlock value].
	token := UIManager default requestPassword: ('Token for {1}:' format: {aStringOrUrl}).
	token isEmptyOrNil ifTrue: [^ aBlock value].
	^ {username. token}