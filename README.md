# Harbor Problem Solver 🏗️🚚🤖

Welcome to the **Harbor Problem Solver** repository! This project is a PDDL (Planning Domain Definition Language) based solution to a classic harbor logistics problem. It involves optimizing the movement of containers and robots (trucks) across docks to achieve a desired configuration. Let’s dive into the details! 🌊

---

## 📖 Problem Overview

In this problem, we have:
- **Docks** 🏗️: Connected by bidirectional roads. Each dock can host an infinite number of container stacks but only one robot at a time.
- **Containers** 📦: Located at docks, containers can be stacked on top of each other or placed individually.
- **Robots** 🤖: Equipped with cranes, robots can move between docks, pick up one container at a time, and stack or drop containers.

### Initial State 🏁
- **Docks**: 3 docks (`d1`, `d2`, `d3`) connected by roads (`d1-d2` and `d1-d3`).
- **Containers**: 
  - Dock `d1`: Stack of `c1` (bottom) and `c3` (top).
  - Dock `d2`: Single container `c2`.
- **Robot**: `r1` is initially at dock `d2`.

### Goal State 🎯
- **Containers**: 
  - Dock `d3` should have two stacks: `c3` and `c2` (with `c1` stacked on top of `c2`).
- **Robot**: `r1` should be at dock `d1`.

---

## 🛠️ Solution Approach

The problem is solved using **PDDL**, a language for defining planning problems. The solution involves a sequence of actions for the robot to achieve the goal state. Here’s a high-level breakdown of the **optimal plan**:

1. Move the robot between docks. 🚗
2. Pick up, drop, and stack containers. 🏗️📦
3. Ensure the robot ends up at the correct dock. ✅

The plan consists of **19 steps**, carefully orchestrated to avoid conflicts and achieve the goal efficiently. For example:
- The robot moves from `d2` to `d1` to unstack `c1` and `c3`.
- It then transports containers to `d3` and rearranges them to meet the goal configuration.

---
