# mutate_when_predicate

this is an example of mutating a column but only for certain rows, if a condition is TRUE

looking at the data, the idea is as follows:

for each person in the data, I need to fill the column called `to_fill`. However, I want to do so only 

1 - where `to_fill` has more than one unique value by `col_a` and `col_c` 
    (basically, for a given individual grouped by `col_a` and `col_c`, `to_fill` is not constant) BUT
    
2 - only if it is empty where `col_b` is "S"

3 - and do so by groups formed by `col_a` and `col_c`

after running the code, new_loc2 is the required solution; 
values of `to_fill` where `col_b` equal "S" are replaced by the values where `col_b` equals "W"

