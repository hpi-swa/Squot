I iterate over two graphs of objects and point out the differences.

When two objects can supposedly transformed into each other, I iterate over their references and provide the pairs of values to my client. My client is then supposed to compute the diff of the pair of values.

When two objects supposedly cannot be transformed into each other, because, for example, their classes are different, I report this to the client.

I am also able to walk along objects that are not present on the left side of the comparison. The left object will be reported as nil to my client then. Walking along added objects is necessary because added objects might (indirectly) refer to existing objects again. These existing objects might not be reachable from any other existing objects, but nevertheless they must be walked by, such that my client may compute their differences.