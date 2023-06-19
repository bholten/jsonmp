(lang dune 3.8)

(name jsonmp)

(generate_opam_files true)

(source
 (github bholten/jsonmp))

(authors "Brennan Holten")

(maintainers "Brennan Holten")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name jsonmp)
 (synopsis "RFC 7386 compliant JSON merge patch")
 (description "A library an CLI for RFC 7386 compliant JSON merge patch")
 (depends ocaml dune alcotest yojson)
 (tags
  (topics "to describe" your project)))
 
 ; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
