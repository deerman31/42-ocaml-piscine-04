let my_sleep () = Unix.sleep 1

let micro_nap x =
  for i = 1 to x do
    my_sleep ()
  done

let get_arg () =
  try Some Sys.argv.(1)
  with Invalid_argument _ ->
    print_endline "Argument required";
    None

let () =
  match get_arg () with
  | Some arg -> (
      match int_of_string_opt arg with
      | Some num when num > 0 -> micro_nap num
      | Some _ -> print_endline "Argument must be a positive integer."
      | None -> print_endline "invalid argument")
  | None -> ()
