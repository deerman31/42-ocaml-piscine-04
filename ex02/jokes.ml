let () = Random.self_init ()

let jokes () =
  let joke1 =
    "1: The doctor told me I had a week to live. But I didn't die after a week \
     passed. I'm thinking of suing the doctor."
  in
  let joke2 =
    "2: When I made a mistake at work, they said \"Everyone makes mistakes.\" \
     But I'm a brain surgeon."
  in
  let joke3 =
    "3: My boss told me I had unlimited potential. I guess that means my \
     salary will never go up either."
  in
  let joke4 =
    "4: \"Life is short,\" they say, but Monday mornings are abnormally long.)"
  in
  let joke5 =
    "5: They said young people these days have no backbone. But I'm an \
     orthopedic surgeon."
  in
  let lst = [ joke1; joke2; joke3; joke4; joke5 ] in
  let random_number = Random.int 5 in
  print_endline (List.nth lst random_number)

let () = jokes ()
