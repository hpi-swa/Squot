commands
writeShallowLines: shallowLines
	^ shallowLines do: [ :shallow | self writeCommand: 'shallow' arguments: shallow withLineTerminator: true ]