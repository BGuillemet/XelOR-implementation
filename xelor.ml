exception Unsat

let rec remove a l = match l with
  | [] -> []
  | x :: q -> if x = a then q else (remove a q)

(* Evalue une clause de xor *)
let rec eval_xor f rho = match f with
  | [] -> 0
  | l :: f2 -> let e = eval_xor f2 rho in
               if l > 0 then (rho.(l) + e) mod 2
               else (1 - rho.(l) + e) mod 2

(* Négation d'une clause de xor *)
let neg_xor c = match c with
  | [] -> []
  | l :: c2 -> (-l) :: c2

(* Remplace le littéral l (positif) par la clause g dans la clause c *)
let rec replace_neg_clause l g c = match c with
  | [] -> []
  | l2 :: c2 when l2 = l -> g @ c2
  | l2 :: c2 when l2 = -l -> (neg_xor g) @ c2
  | l2 :: c2 -> l2 :: (replace_neg_clause l g c2)

(* Simplifie une clause si une variable apparaît plusieurs fois *)
let rec simpl_clause c = match c with
  | [] -> []
  | l :: c2 -> if List.mem l c2 then simpl_clause (remove l c2)
               else if List.mem (-l) c2 then simpl_clause (neg_xor (remove (-l) c2))
               else simpl_clause c2

(* Remplace le littéral l (positif) par la clause g dans la formule f,
   et simplifie la formule *)
let replace_neg l g f = List.map simpl_clause (List.map (replace_neg_clause l g) f)

(* Renvoie une valuation satisfaisant la formule f en modifiant la
   valuation rho, ou une exception si la formule n'est pas satisfiable *)
let rec xelor f rho = match f with
  | [] -> rho
  | c :: f2 -> (match c with
                  | [] -> raise Unsat
                  | [l] when l > 0 -> rho.(l) <- 1; rho
                  | [l] -> rho
                  | l1 :: l2 :: c2 -> let l, g = (if l1 > 0 then l1, (l2::c2)
                                                  else if l2 > 0 then l2, (l1::c2)
                                                  else (-l1), ((-l2)::c2)) in
                                      let rho2 = xelor (replace_neg l g f2) rho in
                                      rho2.(l) <- eval_xor g rho;
                                      rho2)