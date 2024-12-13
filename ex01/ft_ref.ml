(*
type <- 型定義
'a <- 型パラメータ(多相型)
ft_ref <- 定義する型の名前
{ <- レコード型の開始
mutable <- フィールド名が可変であることを示す
contents <- フィールド名
: <- フィールドの型指定
'a <- フィールドの型(型パラメータを使用)

} <-

ft_refはレコード型。なぜ、フィールド数がひとつしかないのにフィールドのみを可変にしたいのでレコードにしている。

1 可変性の範囲制限
type 'a ft_ref = { mutable contents : 'a }
このように定義すると:
レコードそのものは不変
contentsフィールドのみが可変

対比として、以下のような単純な型定義を考えてみましょう:
type 'a ft_ref = mutable 'a  (* これは実際には不可能な構文 *)
この場合:
型全体が可変になってしまう
OCamlの型システムではこのような直接的な可変型は許可されていない
2 カプセル化
*)
type 'a ft_ref = { mutable contents : 'a }

let return x = { contents = x }

(* ! *)
let get r = r.contents

(* := *)
let set r x = r.contents <- x
let bind r f = f r.contents

let test () =
  let return_test () =
    print_string "[return] -> ";
    let r1 = return 42 in
    let test1 = r1.contents = 42 in
    let r2 = return "42" in
    let test2 = r2.contents = "42" in
    let r3 = return 4.2 in
    let test3 = r3.contents = 4.2 in
    print_endline (if test1 && test2 && test3 then "OK" else "NG")
  in
  let get_test () =
    print_string "[get] -> ";
    let r1 = return 42 in
    let test1 = get r1 = 42 in
    let r2 = return "42" in
    let test2 = get r2 = "42" in
    let r3 = return 4.2 in
    let test3 = get r3 = 4.2 in
    print_endline (if test1 && test2 && test3 then "OK" else "NG")
  in
  let set_test () =
    print_string "[set] -> ";
    let r1 = return 42 in
    set r1 24;
    let test1 = get r1 = 24 in
    let r2 = return "42" in
    set r2 "24";
    let test2 = get r2 = "24" in
    let r3 = return 4.2 in
    set r3 2.4;
    let test3 = get r3 = 2.4 in
    print_endline (if test1 && test2 && test3 then "OK" else "NG")
  in

  let bind_test () =
    print_string "[bind] -> ";
    let r1 = return 42 in
    let result1 = bind r1 (fun x -> return (x + 1)) in
    let test1 = get result1 = 43 in
    let r2 = return "hello" in
    let result2 = bind r2 (fun x -> return (String.uppercase_ascii x)) in
    let test2 = get result2 = "HELLO" in
    print_endline (if test1 && test2 then "OK" else "NG")
  in

  return_test ();
  get_test ();
  set_test ();
  bind_test ()

let () = test ()
