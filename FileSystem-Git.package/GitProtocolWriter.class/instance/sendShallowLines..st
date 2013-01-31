sending
sendShallowLines: shallowLines
	^ shallowLines do: [ :shallow | self sendCommand: 'shallow' arguments: shallow withLineTerminator: true ]