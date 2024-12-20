(* let examples_of_file file_path =
   let generate_array_and_string line =
     let helper strs =
       let len = List.length strs in
       let index = ref 0 in
       let array = ref (Array.make (len - 1) 0.0) in
       while !index < len - 1 do
         !array.(!index) <- float_of_string (List.nth strs !index);
         index := !index + 1
       done;
       (!array, List.nth strs !index)
     in
     helper (String.split_on_char ',' line)
   in
   let lines = read_file_line_by_line file_path in
   List.map generate_array_and_string lines *)

let print_examples examples =
  (* 各要素（配列とラベル）を出力する補助関数 *)
  let print_example (arr, label) =
    (* 配列の要素を文字列として結合 *)
    let arr_str =
      Array.fold_left
        (fun acc x ->
          if acc = "" then Printf.sprintf "%.2f" x
          else Printf.sprintf "%s, %.2f" acc x)
        "" arr
    in
    Printf.printf "[%s] -> %s\n" arr_str label
  in
  (* リストの各要素に対して出力関数を適用 *)
  List.iter print_example examples

let handle_error msg =
  Printf.fprintf stderr "Error: %s\n" msg;
  exit 1

let read_file_line_by_line filename =
  let channel =
    try open_in filename
    with Sys_error msg ->
      handle_error (Printf.sprintf "Cannot open file '%s': %s" filename msg)
  in

  let rec read_line acc =
    try
      let line = input_line channel in
      if String.trim line = "" then
        handle_error (Printf.sprintf "Empty line found in file '%s'" filename);
      read_line (line :: acc)
    with
    | End_of_file ->
        close_in channel;
        List.rev acc
    | Sys_error msg ->
        close_in_noerr channel;
        handle_error (Printf.sprintf "Error reading file: %s" msg)
    | Invalid_argument msg ->
        close_in_noerr channel;
        handle_error (Printf.sprintf "Invalid data in file: %s" msg)
  in
  try read_line []
  with e ->
    close_in_noerr channel;
    raise e

let examples_of_file file_path =
  let lines = read_file_line_by_line file_path in

  let generate_array_and_string line =
    let safe_float_of_string s =
      try float_of_string s
      with Failure _ ->
        handle_error (Printf.sprintf "Invalid number format '%s'" s)
    in
    match List.rev (String.split_on_char ',' line) with
    | [] -> failwith "Empty line encountered"
    | first :: rest ->
        let f_array =
          Array.of_list (List.map safe_float_of_string (List.rev rest))
        in
        (f_array, first)
  in
  try List.map generate_array_and_string lines
  with e ->
    handle_error
      (Printf.sprintf "Error processing file '%s': %s" file_path
         (Printexc.to_string e))

let () =
  let arg =
    try Sys.argv.(1)
    with Invalid_argument _ -> handle_error "Argument required"
  in

  if not (Sys.file_exists arg) then
    handle_error (Printf.sprintf "File '%s' does not exist" arg);

  try
    let lst = examples_of_file arg in
    print_examples lst
  with e ->
    handle_error (Printf.sprintf "Unexpected error: %s" (Printexc.to_string e))
