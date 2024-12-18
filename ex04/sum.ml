let sum f1 f2 = f1 +. f2

let () =
  (* 基本的なケース *)
  Printf.printf "Test 1 (Basic addition): %.2f\n" (sum 3.14 2.86);

  (* 期待値: 6.00 *)

  (* 負の数のケース *)
  Printf.printf "Test 2 (Negative numbers): %.2f\n" (sum (-5.0) (-3.0));

  (* 期待値: -8.00 *)

  (* ゼロを含むケース *)
  Printf.printf "Test 3 (Adding zero): %.2f\n" (sum 42.0 0.0);

  (* 期待値: 42.00 *)

  (* 小数点以下の精度が必要なケース *)
  Printf.printf "Test 4 (Decimal precision): %.10f\n" (sum 0.1 0.2);

  (* 期待値: 0.3000000000 *)

  (* 大きな数値のケース *)
  Printf.printf "Test 5 (Large numbers): %.2f\n" (sum 1000000.0 2000000.0);

  (* 期待値: 3000000.00 *)

  (* 非常に小さな数値のケース *)
  Printf.printf "Test 6 (Very small numbers): %.10f\n" (sum 0.0000001 0.0000002);

  (* 期待値: 0.0000003000 *)

  (* 正と負の組み合わせのケース *)
  Printf.printf "Test 7 (Mixed signs): %.2f\n" (sum 10.5 (-5.5));

  (* 期待値: 5.00 *)

  (* 同じ数の加算のケース *)
  Printf.printf "Test 8 (Same numbers): %.2f\n" (sum 3.333 3.333);

  (* 期待値: 6.67 *)
  print_endline (string_of_float (sum 0.1 0.2))