let eu_dist array1 array2 =
  let new_array = Array.mapi (
    fun i x ->
      let diff = array2.(i) -. x in
      diff *. diff
  ) array1 in
  let sum = Array.fold_left (+.) 0.0 new_array in
  sqrt sum

  (* let accumulate_squared_difference value1 value2 accumulated_sum =
    let difference = value2 -. value1 in
    let squared_difference = difference *. difference in
    accumulated_sum +. squared_difference
  in

  let len = Array.length array1 in
  let i = ref 0 in
  let squared_sum = ref 0.0 in
  while !i < len do
    squared_sum :=
      accumulate_squared_difference array1.(!i) array2.(!i) !squared_sum;
    i := !i + 1
  done;
  sqrt !squared_sum *)

let test () =
  let test1 () =
    let a1 = [| 1.0; 2.0 |] in
    let a2 = [| 4.0; 6.0 |] in
    let d = eu_dist a1 a2 in
    (* 5.0 が返される *)
    print_endline (if d = 5.0 then "OK" else "NG")
  in
  test1 ()

let () = test ()
