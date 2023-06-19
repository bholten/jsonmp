open Jsonmp.Patch


let test1_source = Yojson.Basic.from_file "test1_source.json"
let test1_patch = Yojson.Basic.from_file "test1_patch.json"
(* Note, according to the RFC, deletions aren't propagated to parent
   objects, so "c" will be an empty JSON object here: *)
let test1_result = Yojson.Basic.from_string {|
{
    "a": {
	"b": 123, 
        "c": {}
    },
    "asdf": "f",
    "e": "123",
    "g": [1, 2, 3]
}                                           
|}

(* This is the example from the RFC, see: https://www.rfc-editor.org/rfc/rfc7386#section-3 *)
let example_rfc = Yojson.Basic.from_file "example_rfc.json"
let example_rfc_patch = Yojson.Basic.from_file "example_rfc_patch.json"
let example_rfc_result = Yojson.Basic.from_string {|
       {
         "title": "Hello!",
         "author" : {
       "givenName" : "John"
         },
         "tags": [ "example" ],
         "content": "This will be unchanged",
         "phoneNumber": "+01-123-456-7890"
       }
|}

let test_1 () =
  let open Alcotest in
  let patch = merge_patch test1_source test1_patch in
  check (module Yojson.Basic) "equal" patch test1_result
  
let rfc_test () =
  let open Alcotest in
  let patch = merge_patch example_rfc example_rfc_patch in
  check (module Yojson.Basic) "equal" patch example_rfc_result


let test_set = [
  "First test", `Quick, test_1;
  "RFC test", `Quick, rfc_test;
]

let () =
  Alcotest.run "My Project Tests" [
      "suite", test_set;
    ]
