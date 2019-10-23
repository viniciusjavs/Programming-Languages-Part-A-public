(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3.sml";

val test1_0 = only_capitals ["A","B","C"] = ["A","B","C"]
val test1_1 = only_capitals ["a","b","c"] = []
val test1_2 = only_capitals [] = []
val test1_3 = only_capitals ["A","b","C"] = ["A","C"]
val test1_4 = only_capitals ["a","B","C"] = ["B","C"]
val test1_5 = only_capitals ["Abc","BBc","cDC"] = ["Abc","BBc"]

val test2_0 = longest_string1 ["A","bc","C"] = "bc"
val test2_1 = longest_string1 [] = ""
val test2_2 = longest_string1 ["Aa","bc","C"] = "Aa"
val test2_3 = longest_string1 [""] = ""
val test2_4 = longest_string1 ["A"] = "A"
val test2_5 = longest_string1 ["Aa","bc","Ccc"] = "Ccc"
val test2_6 = longest_string1 ["Aa","","C", "D"] = "Aa"
val test2_7 = longest_string1 ["","","C", "D", "EE", "FF"] = "EE"

val test3_0 = longest_string2 ["A","bc","C"] = "bc"
val test3_1 = longest_string2 [] = ""
val test3_2 = longest_string2 ["A","bc","Cc"] = "Cc"
val test3_3 = longest_string2 [""] = ""
val test3_4 = longest_string2 ["A"] = "A"
val test3_5 = longest_string2 ["Aaa","bc","Cc"] = "Aaa"
val test3_6 = longest_string2 ["A","","C", "Dd"] = "Dd"
val test3_7 = longest_string2 ["","","C", "D", "EE", "FF"] = "FF"

val test4a_0 = longest_string3 ["A","bc","C"] = "bc"
val test4a_1 = longest_string3 [] = ""
val test4a_2 = longest_string3 ["Aa","bc","C"] = "Aa"
val test4a_3 = longest_string3 [""] = ""
val test4a_4 = longest_string3 ["A"] = "A"
val test4a_5 = longest_string3 ["Aa","bc","Ccc"] = "Ccc"
val test4a_6 = longest_string3 ["Aa","","C", "D"] = "Aa"
val test4a_7 = longest_string3 ["","","C", "D", "EE", "FF"] = "EE"

val test4b_0 = longest_string4 ["A","B","C"] = "C"
val test4b_1 = longest_string4 ["A","bc","C"] = "bc"
val test4b_2 = longest_string4 [] = ""
val test4b_3 = longest_string4 ["A","bc","Cc"] = "Cc"
val test4b_4 = longest_string4 [""] = ""
val test4b_5 = longest_string4 ["A"] = "A"
val test4b_6 = longest_string4 ["Aaa","bc","Cc"] = "Aaa"
val test4b_7 = longest_string4 ["A","","C", "Dd"] = "Dd"
val test4b_8 = longest_string4 ["","","C", "D", "EE", "FF"] = "FF"

val test5_0 = longest_capitalized ["A","bc","C"] = "A"
val test5_1 = longest_capitalized ["A","Bc","Cc"] = "Bc"
val test5_2 = longest_capitalized ["A","Bc","Ccc"] = "Ccc"
val test5_3 = longest_capitalized [] = ""
val test5_4 = longest_capitalized ["."] = ""

val test6_0 = rev_string "abc" = "cba"
val test6_1 = rev_string "arara" = "arara"
val test6_2 = rev_string "" = ""
val test6_3 = rev_string "a" = "a"

val test7_0 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7_1 = ((first_answer (fn x => if x > 3 then SOME x else NONE) []; false) handle NoAnswer => true)
val test7_2 = ((first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3]; false) handle NoAnswer => true)
val test7_3 = first_answer (fn x => if x = 1 then SOME x else NONE) [1,2,3,4,5] = 1
val test7_4 = first_answer (fn x => if x = 5 then SOME x else NONE) [1,2,3,4,5] = 5

val test8_0 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8_1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,2,3,4,5,6] = NONE
val test8_2 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1] = SOME [1]
val test8_3 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,1] = SOME [1,1]
val test8_4 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []

val test9a_0 = count_wildcards Wildcard = 1
val test9a_1 = count_wildcards UnitP = 0
val test9a_2 = count_wildcards (ConstP 0) = 0
val test9a_3 = count_wildcards (Variable "a") = 0
val test9a_4 = count_wildcards (TupleP [Wildcard, Variable "a", Wildcard]) = 2
val test9a_5 = count_wildcards (TupleP [UnitP, Variable "a", ConstP 0]) = 0
val test9a_6 = count_wildcards (ConstructorP ("a", (TupleP [Wildcard, Variable "a", Wildcard]))) = 2

val test9b_0 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b_1 = count_wild_and_variable_lengths Wildcard = 1
val test9b_2 = count_wild_and_variable_lengths UnitP = 0
val test9b_3 = count_wild_and_variable_lengths (ConstP 0) = 0
val test9b_4 = count_wild_and_variable_lengths (Variable("aa")) = 2
val test9b_5 = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "aa", Wildcard]) = 4
val test9b_6 = count_wild_and_variable_lengths (ConstructorP ("a", (TupleP [Wildcard, Variable "aaa", Wildcard]))) = 5

val test9c_0 = count_some_var ("x", Variable("x")) = 1
val test9c_1 = count_some_var ("x", Variable("y")) = 0
val test9c_2 = count_some_var ("x", Wildcard) = 0
val test9c_3 = count_some_var ("x", (ConstP 0)) = 0
val test9c_4 = count_some_var ("x", (TupleP [Wildcard, Variable "x", Wildcard, Variable "x"])) = 2
val test9c_5 = count_some_var ("x", (ConstructorP ("a", (TupleP [Wildcard, Variable "x", Wildcard])))) = 1

val test10_0 = check_pat (Variable("x")) = true
val test10_1 = check_pat Wildcard = true
val test10_2 = check_pat (ConstP 0) = true
val test10_3 = check_pat (TupleP [Wildcard, Variable "x", Wildcard, Variable "y"]) = true
val test10_4 = check_pat (TupleP [Wildcard, Variable "x", Wildcard, Variable "x"]) = false
val test10_5 = check_pat (ConstructorP ("a", (TupleP [Wildcard, Variable "x", Wildcard]))) = true
val test10_6 = check_pat (ConstructorP ("a", (TupleP [Wildcard, Variable "x", Variable "xx", Wildcard]))) = true
val test10_7 = check_pat (ConstructorP ("a", (TupleP [Wildcard, Variable "x", Variable "x", Wildcard]))) = false

val test11_0 = match (Const 1, UnitP) = NONE
val test11_1 = match (Const 1, ConstP 2) = NONE
val test11_2 = match (Const 1, ConstP 1) = SOME []
val test11_3 = match (Unit, UnitP) = SOME []
val test11_4 = match (Unit, ConstP 1) = NONE
val test11_5 = match (Unit, Wildcard) = SOME []
val test11_6 = match (Unit, Variable "s") = SOME [("s", Unit)]
val test11_7 = match (Const 1, Variable "s") = SOME [("s", Const 1)]
val test11_8 = match (Tuple [], UnitP) = NONE
val test11_9 = match (Tuple [], TupleP [UnitP, Variable "s", Wildcard, ConstP 1]) = NONE
val test11_10 = match (Tuple [Unit], TupleP [UnitP, Variable "s", Wildcard, ConstP 1]) = NONE
val test11_11 = match (Tuple [Unit, Const 1, Const 2, Unit], TupleP [UnitP, Variable "s", Wildcard, ConstP 1]) = NONE
val test11_12 = match (Tuple [Unit, Const 1, Const 2], TupleP [UnitP, Wildcard, ConstP 2]) = SOME []
val test11_13 = match (Tuple [Unit, Const 1, Const 2], TupleP [UnitP, Variable "s", ConstP 2]) = SOME [("s", Const 1)]
val test11_14 = match (Tuple [Unit, Const 1, Const 2], ConstructorP("p", TupleP [UnitP, Variable "s", ConstP 2])) = NONE
val test11_15 = match (Constructor("p", Tuple [Unit, Const 1, Const 2]), ConstructorP("q", TupleP [UnitP, Variable "s", ConstP 2])) = NONE
val test11_16 = match (Constructor("p", Tuple [Unit, Const 1, Const 2]), ConstructorP("p", TupleP [UnitP, Variable "s", ConstP 1])) = NONE
val test11_17 = match (Constructor("p", Tuple [Unit, Const 1, Const 2]), ConstructorP("p", TupleP [UnitP, Variable "s", ConstP 2])) = SOME [("s", Const 1)]
val test11_18 = match (Constructor("p", Tuple [Unit, Const 1, Const 2]), ConstructorP("p", TupleP [UnitP, Variable "s", Variable "r"])) = SOME [("s", Const 1), ("r", Const 2)]
val test11_19 = match (Constructor("p", Unit), ConstructorP("p", UnitP)) = SOME []
val test11_20 = match (Constructor("p", Const 1), ConstructorP("p", ConstP 1)) = SOME []

val test12_0 = first_match Unit [UnitP] = SOME []
val test12_1 = first_match Unit [] = NONE
val test12_2 = first_match Unit [ConstP 1, UnitP] = SOME []
val test12_3 = first_match Unit [ConstP 1] = NONE
val test12_4 = first_match Unit [Variable "s"] = SOME [("s", Unit)]
val test12_5 = first_match Unit [ConstP 1, Variable "s"] = SOME [("s", Unit)]
val test12_6 = first_match Unit [ConstP 1, ConstP 2] = NONE
