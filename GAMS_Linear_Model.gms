* Linear Programming (LP) for Economic Dispatch
* System: 3-Bus Network
Sets
    j  Indices for variables /C1*C7/
    i  Indices for equality constraints /B1*B3/
    u  Indices for inequality constraints /D1*D10/;

Parameters
    b(i) /B1 0.5, B2 0.6, B3 3/
    d(u) /D1 1.26, D2 1.26, D3 2.50, D4 2.50, D5 1.30, D6 1.30, D7 1.40, D8 2.85, D9 0.90, D10 0.85/
    c(j) /C1 10, C2 20, C3 14, C4 15/;

Table A(i,j)
        C1  C2  C3  C4  C5   C6   C7
    B1   1   1   0   0  -10   5    5
    B2   0   0   1   0   5   -15  10
    B3   0   0   0   1   5    10  -15;

Table G(u,j)
         C1  C2  C3  C4  C5   C6   C7
    D1    0   0   0   0   5   -5    0
    D2    0   0   0   0  -5    5    0
    D3    0   0   0   0   5    0   -5
    D4    0   0   0   0  -5    0    5
    D5    0   0   0   0   0    10  -10
    D6    0   0   0   0   0   -10   10
    D7    1   0   0   0   0    0    0
    D8    0   1   0   0   0    0    0
    D9    0   0   1   0   0    0    0
    D10   0   0   0   1   0    0    0;

Variables
    COST
    X(j);

Positive Variable X;

Equations
    Objective
    Equality(i)
    Inequality(u);

Objective..     COST =e= sum(j, c(j)*X(j));
Equality(i)..   sum(j, A(i,j)*X(j)) =e= b(i);
Inequality(u).. sum(j, G(u,j)*X(j)) =l= d(u);

Model power_plan /all/;
Solve power_plan using lp minimizing COST;

Display X.l, COST.l;
