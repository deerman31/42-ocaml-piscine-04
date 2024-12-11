let my_sleep () = Unix.sleep 1

let micro_nap x =
  for i = 1 to x do
    my_sleep ()
  done

let get_arg () = try int_of_string Sys.argv.(1) with _ -> 0

let () =
  let arg = get_arg () in
  micro_nap arg
