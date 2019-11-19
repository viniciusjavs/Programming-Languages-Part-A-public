(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw2.sml";

val test1_0 = all_except_option ("string", ["string"]) = SOME []
val test1_1 = all_except_option ("string", []) = NONE
val test1_2 = all_except_option ("string", ["string_one","string_two"]) = NONE
val test1_3 = all_except_option ("string", ["string","string_two"]) = SOME ["string_two"]
val test1_4 = all_except_option ("string", ["string_one","string"]) = SOME ["string_one"]
val test1_5 = all_except_option ("string", ["string","string_one","string_two"]) = SOME ["string_one","string_two"]
val test1_6 = all_except_option ("string", ["string_one","string_two","string"]) = SOME ["string_one","string_two"]
val test1_7 = all_except_option ("string", ["string_one","string","string_two"]) = SOME ["string_one","string_two"]

val test2_0 = get_substitutions1 ([["foo"], ["there"]], "foo") = []
val test2_1 = get_substitutions1 ([[], []], "foo") = []
val test2_2 = get_substitutions1 ([], "foo") = []
val test2_3 = get_substitutions1 ([["foo", "bar"], ["there"]], "foo") = ["bar"]
val test2_4 = get_substitutions1 ([["foo"], ["there", "bar"]], "foo") = []
val test2_5 = get_substitutions1 ([["foo"], ["there", "bar"]], "bar") = ["there"]
val test2_6 = get_substitutions1 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") =  ["Fredrick","Freddie","F"]
val test2_7 = get_substitutions1 ([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test3_0 = get_substitutions2 ([["foo"], ["there"]], "foo") = []
val test3_1 = get_substitutions2 ([[], []], "foo") = []
val test3_2 = get_substitutions2 ([], "foo") = []
val test3_3 = get_substitutions2 ([["foo", "bar"], ["there"]], "foo") = ["bar"]
val test3_4 = get_substitutions2 ([["foo"], ["there", "bar"]], "foo") = []
val test3_5 = get_substitutions2 ([["foo"], ["there", "bar"]], "bar") = ["there"]
val test3_6 = get_substitutions2 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val test3_7 = get_substitutions2 ([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test4_0 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	      [{first="Fred", last="Smith", middle="W"},
	       {first="Fredrick", last="Smith", middle="W"},
	       {first="Freddie", last="Smith", middle="W"},
	       {first="F", last="Smith", middle="W"}]
val test4_1 = similar_names ([["Fredrick"],["Elizabeth","Betty"],["Freddie","F"]], {first="Fred", middle="W", last="Smith"}) =
	      [{first="Fred", last="Smith", middle="W"}]
val test4_2 = similar_names ([], {first="Fred", middle="W", last="Smith"}) = [{first="Fred", last="Smith", middle="W"}]

val test5_0 = card_color (Clubs, Num 2) = Black
val test5_1 = card_color (Hearts, Ace) = Red
val test5_2 = card_color (Diamonds, King) = Red
val test5_3 = card_color (Spades, Num 4) = Black

val test6_0 = card_value (Clubs, Num 2) = 2
val test6_1 = card_value (Hearts, Ace) = 11
val test6_2 = card_value (Diamonds, Jack) = 10
val test6_3 = card_value (Spades, Queen) = 10

val test7_0 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7_1 = remove_card ([(Hearts, Ace), (Spades, Queen)], (Hearts, Ace), IllegalMove) = [(Spades, Queen)]
val test7_2 = remove_card ([(Hearts, Ace), (Spades, Queen), (Clubs, Ace)], (Clubs, Ace), IllegalMove) = [(Hearts, Ace), (Spades, Queen)]
val test7_3 = remove_card ([(Hearts, Ace), (Spades, Queen), (Spades, Queen)], (Spades, Queen), IllegalMove) = [(Hearts, Ace),(Spades, Queen)]
val test7_4 = ((remove_card ([(Hearts, Ace)], (Spades, Queen), IllegalMove); false)
	       handle IllegalMove => true)
val test7_5 = ((remove_card ([], (Hearts, Ace), IllegalMove); false) handle IllegalMove => true)

val test8_0 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test8_1 = all_same_color [(Clubs,Ace)] = true
val test8_2 = all_same_color [(Clubs,Ace)] = true
val test8_3 = all_same_color [(Clubs,Ace), (Spades,Ace), (Diamonds,Ace)] = false

val test9_0 = sum_cards [(Clubs, Num 2), (Clubs, Num 2)] = 4
val test9_1 = sum_cards [(Spades, Num 2)] = 2
val test9_2 = sum_cards [] = 0
val test9_3 = sum_cards [(Clubs, Ace), (Diamonds, King)] = 21
val test9_4 = sum_cards [(Clubs, Jack), (Hearts, Queen)] = 20

val test10_0 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10_1 = score ([(Hearts, Num 2),(Clubs, Num 4)],6) = 0
val test10_2 = score ([(Hearts, Num 2),(Clubs, Num 4)],2) = 12
val test10_3 = score ([(Hearts, Num 2),(Diamonds, Num 4)],10) = 2
val test10_4 = score ([(Hearts, Num 2),(Clubs, Num 4)],0) = 18
val test10_5 = score ([(Spades, Num 2),(Clubs, Num 4)],0) = 9

val test11_0 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test11_1 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                          [Draw,Draw,Draw,Draw,Draw],
                          42) = 3
val test11_2 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                           [Draw,Discard(Hearts,Jack)],
                           42);
		 false)
		handle IllegalMove => true)
