let string_prefix_equal s1 s2 n =
  let n = min n (min (String.length s1) (String.length s2)) in
  String.sub s1 0 n = String.sub s2 0 n



let () =
  let s1 = "42tokyo: paris" in
  let s2 = "42Tokyo: " in

  print_endline s1;
  print_endline s2;
  print_endline (string_of_bool (string_prefix_equal s1 s2 (String.length s2 -0)))