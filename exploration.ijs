print_digits =: 4 (1!:2)~ LF , LF ,~ 2 }. ]
groups_of =: 0j1 * *
xdiv =: % x:

NB. a = 1 / 99x00y
NB. a = (0.99x00y + 1e-3 * (10 - x) - 1e-6 * y) / 99x00y
NB. a = 1e-6 + 1e-3 * (10 - x) / 99x00y - 1e-6 * y / 99x00y
NB. a = 1e-6 + 1e-3 * (10 - x) * a - 1e-6 * y * a

NB. From this, we have a sequence S_n = e-3*n + (10 - x) * S_n+1 - y * S_n+2,
NB. To get the coefficient of e-3*n we calculate the number of occurences of
NB. S_n, which turns out to be a recurrence relation
NB. c_n = (10 - x) * c_n-1 + (-y) * c_n-2

NB. The relation breaks down when the coefficients become so larger than 1e3,
NB. and thus begin to interfere with prior (larger) coefficients, or less than
NB. 1, so as to interfere with future (smaller) coefficients
NB.
NB. We can extend the number to have more 9s and 0s to change e-3 to e-4 or
NB. further, which delays the interference.
NB.
NB. For example, 997001 only shows the three digit elements of A001906, until
NB. 987 is interfered with by 2584
NB.
NB. Instead, 99970001 shows the four digit elements of A001906, until
NB. 6765 is interfered with by 17711

NB. The equation 99x00y can be generalized to other patterns, as long as x and y
NB. are reasonable
NB.
NB. For example, 998999 can be said to have x = 1, y = 1, and ends up producing
NB. the fibonacci sequence

NB. We can also expand the number to introduce more terms into the relation,
NB. e.g. 999700010001 introduces the relation a_n = 3 * a_n-1 - a_n-2 - a_n-3

NB. recurrence relation c_n = 2 * c_n-1 - c_n-2
NB. produces consecutive integers: 1,2,3,4,5,6,...
NB. A000027
print_digits (1000 groups_of 3) ": 1 xdiv 998001

NB. recurrence relation c_n = 3 * c_n-1 - c_n-2
NB. produces alternating elements of fib: 0,1,3,8,21,55,144,...
NB. A001906
print_digits (11 groups_of 4) ": 1 xdiv 99970001

NB. recurrence relation c_n = 3 * c_n-1 - 2 * c_n-2
NB. produces consecutive mersenne numbers 2 ^ n - 1: 1,3,7,15,31,63,...
NB. A000225
print_digits (14 groups_of 4) ": 1 xdiv 99970002

NB. recurrence relation c_n = c_n-1 + c_n-2
NB. produces fibonacci sequence: 1,1,2,3,5,8,13,21,...
NB. A000045
print_digits (17 groups_of 3) ": 1 xdiv 998999

NB. recurrence relation c_n = 2 * c_n-1 + c_n-2
NB. produces pell numbers: 1,2,5,12,29,70,169,...
NB. A000129
print_digits (12 groups_of 4) ": 1 xdiv 998998

NB. recurrence relation c_n = 3 * c_n-1 - c_n-2 - c_n-3
NB. produces A048739: 1,3,8,20,49,119,288,696,...
NB. A048739
print_digits (13 groups_of 4) ": 1 xdiv 999700010001
