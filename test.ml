let strlen s =
  let rec len_helper s pos =
    try
      let _ = s.[pos] in
      len_helper s (pos + 1)
    with Invalid_argument _ -> pos
  in
  len_helper s 0

let split str sep =
  let len = strlen str in
  let rec loop acc1 acc2 index =
    if index = (len - 1) then acc1
    else (
      match str.[index] = sep with
      | true -> 
      | false -> 
    )

let () =
  print_endline (string_of_int (strlen ""))
