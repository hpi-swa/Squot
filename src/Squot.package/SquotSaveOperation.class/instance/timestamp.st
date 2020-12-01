accessing
timestamp
	"If no timestamp is enforced by the client, use the current time.
	Do not store the current time: there might be early accesses to this property long before the version is actually stored in the repository. For example, after the first access users might still get asked to select the changes to save, which might take a while."
	^ timestamp ifNil: [DateAndTime now]