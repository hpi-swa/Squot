unit of work
finish
	"Conclude unit of work. Can be used to release resources.
	Can be called multiple times if there are multiplie clients collaborating on a transaction."
	numberOfClients := self numberOfClients - 1.
	numberOfClients < 0 ifTrue:
		[Warning signal: 'Unit of work finished more often than started'].