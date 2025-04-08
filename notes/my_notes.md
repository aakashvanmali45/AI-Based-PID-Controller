# AI-Based PID Controller

This project demonstrates the use of AI techniques—specifically Genetic Algorithms—to optimize a PID (Proportional-Integral-Derivative) controller for temperature control in a furnace. Implemented in MATLAB and Simulink, it also lays the foundation for extending into real-time control using Reinforcement Learning and Bayesian Optimization.

---

## 🔧 What is a PID Controller?

A **PID Controller** is a widely used feedback control system in industrial automation. It calculates an error value as the difference between a desired setpoint and a measured process variable, and attempts to correct it through proportional, integral, and derivative terms.

### PID Equation:

u(t) = Kp * e(t) + Ki * ∫e(t)dt + Kd * de(t)/dt


Where:
- `u(t)` is the control signal,
- `e(t)` is the error at time `t`,
- `Kp`, `Ki`, and `Kd` are the proportional, integral, and derivative gains respectively.

---

## 🧰 Control System Design

### Components:

- **Set Point (Step Block):** Defines the desired furnace temperature.
- **Error Calculation (Sum Block ±):** Computes the error signal. Inputs:
  - `+`: Desired setpoint  
  - `–`: Output from the furnace model
- **PID Controller Block:** Takes the error signal as input and generates a control signal using the PID equation.
- **Furnace Model:** Simulates real-world furnace behavior using a transfer function.
- **Ambient Temperature (Constant Block):** Represents the constant environmental temperature.
- **Output Sum Block:** Computes the total temperature by summing ambient temperature and the change in temperature due to heating.

---

## 📊 Performance Metrics

- **Steady State Value:** Final stabilized temperature.
- **Settling Time:** Time taken for the system to remain within ±2% of the desired value.
- **Overshoot:** Maximum temperature overshoot above the setpoint.
- **Cost Function:**  
  - **Mean Squared Error (MSE):**  
    \[
    \text{MSE} = \frac{1}{n} \sum_{i=1}^{n}(y_i - \hat{y}_i)^2
    \]  
    Measures average of the squares of the errors between the target and actual temperature.

---

## 🧬 Genetic Algorithm for PID Tuning

A **Genetic Algorithm (GA)** is a bio-inspired optimization technique that mimics the process of natural selection to find optimal solutions.

### How it Works:

1. **Initial Population:** Randomly generates a population of PID parameters.
2. **Fitness Evaluation:** Uses the cost function (MSE) to evaluate the performance of each individual.
3. **Selection:** Chooses the best-performing individuals as parents.
4. **Crossover:** Combines parent solutions to produce new offspring.
5. **Mutation:** Randomly modifies offspring to maintain diversity.
6. **Repeat:** The process continues over several generations until optimal PID values are found.

### MATLAB Implementation:

In MATLAB, Genetic Algorithms can be implemented using the `ga` function from the Global Optimization Toolbox. The PID gains are encoded as a vector `[Kp, Ki, Kd]`, and the fitness function evaluates their performance using the MSE.

---

## 🧠 Why Use Genetic Algorithm?

- Effective for **non-linear** and **complex search spaces**.
- PID tuning doesn't always benefit from gradient-based methods—GA explores diverse solutions.
- Robust in handling **noisy data**.
- Works well with **simulation-based** environments where real-time feedback isn't needed.

---






