(* OASIS_START *)
(* OASIS_STOP *)
Ocamlbuild_plugin.mark_tag_used "tests";;
Ocamlbuild_plugin.dispatch dispatch_default;;

open Ocamlbuild_plugin;;
open Ocamlbuild_pack;;

dispatch begin
  function
  | After_rules ->
     begin match Sys.ocaml_version with
     | "4.04.0" ->
        flag ["ocaml"; "compile"; "open_print_code"] & S[A"-open"; A"Print_code"]
     | "4.07.1" | "4.11.1" ->
        flag ["ocaml"; "compile"; "open_print_code"] & S[A"-open"; A"Codelib"]
     | version ->
        Printf.kprintf failwith "Unsupported OCaml version %s" version
     end
  | _ -> ()
end;;
