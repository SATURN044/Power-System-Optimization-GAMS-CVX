
# Power Generation Optimization Using GAMS and CVX

## Overview

This project investigates **power generation optimization in a three-bus electrical power system** using mathematical optimization techniques. The objective is to **minimize total generation cost** subject to **power balance equations, transmission constraints, and generator capacity limits**.

Both **linear programming (LP)** and **nonlinear programming (NLP)** formulations are considered and solved using two widely used optimization tools:

* **GAMS (General Algebraic Modeling System)** for linear optimization
* **CVX (MATLAB-based convex optimization framework)** for nonlinear optimization

The project demonstrates how the same physical power system can be modeled and solved under different cost structures and optimization paradigms.

---

## Problem Description

A **three-bus power system** interconnected by three transmission lines is considered. The system includes multiple generators and fixed loads. The optimization is performed under the **DC power flow assumption**, neglecting reactive power.

### Objective

Minimize the total generation cost:

* **Linear cost function** (GAMS implementation)
* **Quadratic cost function** (CVX implementation)

---

## System Data

### Transmission Lines

| From | To | Reactance | Capacity |
| ---- | -- | --------- | -------- |
| 1    | 2  | 0.2       | 1.26     |
| 1    | 3  | 0.2       | 1.26     |
| 2    | 3  | 0.1       | 1.30     |

### Generators

| Generator | Max Capacity | Cost Coefficient |
| --------- | ------------ | ---------------- |
| A         | 140          | 10               |
| B         | 285          | 20               |
| C         | 90           | 14               |
| D         | 85           | 15               |

---

## Mathematical Formulation

### Decision Variables

* Generator outputs
* Line flow variables

### Constraints

* Power balance equations
* Transmission line capacity limits
* Generator non-negativity constraints

---

### Linear Programming Formulation

![2025-12-19_204540](https://github.com/user-attachments/assets/bafd0c0d-5f60-4f95-86bd-5797f65c83fc)


This formulation is solved using **GAMS**.

---

### Nonlinear Programming Formulation

![2025-12-19_204630](https://github.com/user-attachments/assets/4714a9dd-adc9-40e4-8204-25364f65bfab)

Subject to the same equality and inequality constraints.
This convex quadratic optimization problem is solved using **CVX in MATLAB**.

---

## Tools and Software

* **GAMS**

  * Linear programming solver
  * High-level algebraic modeling
* **MATLAB**
* **CVX**

  * Disciplined convex programming (DCP)
  * Quadratic cost optimization

---

## Implementation Details

### GAMS

* Sets, parameters, and tables define the network
* Equality and inequality constraints are modeled explicitly
* Linear cost function is minimized
* Solver returns optimal generation levels and marginal costs

**Optimal LP Objective Value:**
`58.35`

---

### CVX (MATLAB)

* Convex quadratic cost functions
* Explicit dual variables for constraints
* Solved using CVX disciplined convex programming rules

**Optimal NLP Objective Value:**
`648.41`

**Optimal Generator Outputs:**

```
x1 = 1.40
x2 = 0.95
x3 = 0.90
x4 = 0.85
```

---

## Results and Discussion

* Linear optimization provides a simplified cost-minimization solution
* Nonlinear optimization captures realistic generator cost curves
* CVX enables concise and readable convex optimization modeling
* Both approaches satisfy all network and operational constraints

