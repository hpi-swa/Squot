sending
done
	self sendCommand: 'done' withLineTerminator: true.
	self flush.