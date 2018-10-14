validating
validateUrl
	| url atSign isHttp |
	url := self remoteUrl.
	((atSign := url indexOf: $@) ~~ 0 and: [atSign < (url indexOf: $:)])
		ifTrue: ["user@host:... SSH Url" ^ false].
	isHttp := (url beginsWith: 'http') and: [(url at: 5) = $: or: [(url copyFrom: 5 to: 6) = 's:']].
	^ isHttp