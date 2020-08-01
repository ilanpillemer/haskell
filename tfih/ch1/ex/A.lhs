
Consider the function

> double :: Integer -> Integer
> double x = 2*x

that doubles an integer. What are the values of the following expressions?

   map double [1,4,4,3]            -->  [2,8,8,6]
   map (double . double) [1,4,4,3] -->  [4,16,16,12]
   map double []                   -->  []

Which of the following assertions are true and why?

   sum . map double = double . sum
   ie 2(x + y) = 2x + 2y


   sum . map sum   = sum . concat
   ie x+(y+z) = (x+y)+z

   sum . sort      = sum
   ie x + y = y + x

