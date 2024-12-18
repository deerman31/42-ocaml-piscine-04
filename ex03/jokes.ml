let () = Random.self_init ()

let jokes lst =
  let random_number = Random.int (List.length lst) in
  print_endline (List.nth lst random_number)

let read_file_line_by_line filename =
  let lines = ref [] in
  let channel = open_in filename in
  try
    while true do
      let line = input_line channel in
      lines := line :: !lines
    done;
    !lines
  with
  | End_of_file ->
      close_in channel;
      !lines
  | e ->
      close_in_noerr channel;
      raise e

let prefix = "joke: "

let string_prefix_equal s1 =
  if String.length s1 <= String.length prefix then false
  else String.sub s1 0 (String.length prefix) = prefix

let trim_joke s =
  String.sub s (String.length prefix) (String.length s - String.length prefix)

let () =
  let arg =
    try Sys.argv.(1)
    with Invalid_argument _ ->
      print_endline "Argument required";
      exit 1
  in

  let lines =
    try read_file_line_by_line arg
    with Sys_error e ->
      print_endline e;
      exit 1
  in

  let jokes_lines = List.filter string_prefix_equal lines in
  jokes (List.map trim_joke jokes_lines)
