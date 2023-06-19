open Jsonmp.Patch


let source_file = ref ""
let patch_file = ref ""

let main () =
  let speclist = [
    ("-s", Arg.Set_string source_file, "The source JSON file");
    ("-p", Arg.Set_string patch_file,  "The patch JSON file");
  ] in
  let usage_msg = "Usage: -s [string] -p [string]" in
  Arg.parse speclist print_endline usage_msg;
  let source = Yojson.Basic.from_file !source_file in
  let patch = Yojson.Basic.from_file !patch_file in
  merge_patch source patch
  |> Yojson.Basic.pretty_to_string ~std:true
  |> print_string
  
let () = main ()
