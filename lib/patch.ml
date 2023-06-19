let rec merge_patch source patch =
  let open Yojson.Basic.Util in
  match source, patch with
  | `Assoc _ as source, `Assoc patch_fields ->
     `Assoc (List.fold_left
               (fun acc (k, v) ->
                 if v = `Null then List.remove_assoc k acc
                 else
                   let target_value = (try List.assoc k (source |> to_assoc) with Not_found -> `Null) in
                   (k, merge_patch target_value v) :: (List.remove_assoc k acc)
               )
               (source |> to_assoc) patch_fields
       )
  | _, `Null -> `Null
  | _, patch -> patch


