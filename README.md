## jsonpm - RFC 7386-Compliant JSON Merge-Patch Tool

Simple library and CLI for doing JSON patch merge operations on JSON
files. Useful for maintaining large JSON files, for example, when
mantaining a massive system configuration that has only minor
differences between environments, which could be patched instead of
being redundant and copying JSON.

### Example

Comes with a CLI in `bin/` that can be build. Otherwise, the library
is just a simple function.

```
Usage: -s [string] -p [string]
  -s The source JSON file
  -p The patch JSON file
  -help  Display this list of options
  --help  Display this list of options

```

Source file:

```jso
{
	"title": "Goodbye!",
	"author" : {
		"givenName" : "John",
		"familyName" : "Doe"
	},
	"tags":[ "example", "sample" ],
	"content": "This will be unchanged"
}
```

Patch file:

```jso
{
	"title": "Hello!",
	"phoneNumber": "+01-123-456-7890",
	"author": {
		"familyName": null
	},
	"tags": [ "example" ]
}

```

Output:

```json
{
	"title": "Hello!",
	"author" : {
		"givenName" : "John"
	},
	"tags": [ "example" ],
	"content": "This will be unchanged",
	"phoneNumber": "+01-123-456-7890"
}
```

See `test/` folder for examples.

### References

- https://www.rfc-editor.org/rfc/rfc7386
