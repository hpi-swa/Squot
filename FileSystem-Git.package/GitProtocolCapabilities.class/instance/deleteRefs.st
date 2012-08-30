capabilities
deleteRefs

	"If the server sends back the 'delete-refs' capability, it means that
it is capable of accepting a zero-id value as the target
value of a reference update.  It is not sent back by the client, it
simply informs the client that it can be sent zero-id values
to delete references."

	^ self enable: #'delete-refs'
