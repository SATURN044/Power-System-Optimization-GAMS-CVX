# Power-System-Optimization-GAMS-CVX
This solves the DC Optimal Power Flow (DCOPF) using the Simplex algorithm.
Power System Economic Dispatch Optimization
# Description: This project focuses on the Economic Dispatch problem within a 3-bus power system. It compares two different mathematical modeling approaches to minimize total generation costs while satisfying power flow and transmission constraints.

# Problem Formulation
# Linear Programming (LP): Solved using GAMS. Uses a linear cost function for generators.
# Nonlinear Programming (NLP): Solved using MATLAB CVX.Uses quadratic cost functions $C(P) = a + bP + cP^2$ for a more realistic representation.
# System Constraints:
Power Balance:DC Power Flow equality constraints.
Transmission Limits: Line capacity constraints (MW).
Generation Limits: Min/Max generator capacity.
ResultsGAMS LP Result: Optimal Value = 58.35CVX 
NLP Result: Optimal Value = 648.41
Requirements: GAMS (General Algebraic Modeling System)MATLAB with CVX Toolbox installed.
Problem Statement: Economic Dispatch in a 3-Bus Power System
# Overview: Consider the following three-bus electrical power system connected by three transmission lines. The network consists of specific load centers and four power generators (A, B, C, and D) distributed across the buses. The primary objective of this optimization problem is to minimize the total generation cost while satisfying the system's power demand and physical constraints.

To simplify the analysis for this implementation, the optimization is performed using DC Power Flow (DCOPF), which neglects reactive power and assumes voltage magnitudes are near 1.0 per unit.
