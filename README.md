# Quiz-Proctoring-System
## Description
## Project 1: Quiz Proctoring System

### Project Overview
A Prolog program to assign Teaching Assistants (TAs) as proctors for quizzes based on their teaching schedules. The system will handle quizzes scheduled at different times during the week, ensuring each quiz has the required number of proctors while considering the constraints of TAs' availability.

### Key Constraints
1. Each quiz requires a specific number of proctors.
2. TAs cannot proctor during their teaching slots.
3. TAs cannot proctor on their day off.
4. A TA cannot proctor more than one quiz at the same time.

### Required Predicates
1. **assign_proctors(AllTAs, Quizzes, TeachingSchedule, ProctoringSchedule)**
   - Assigns TAs to quizzes ensuring all constraints are met.
   - **Parameters:**
     - `AllTAs`: List of TAs with their names and days off.
     - `Quizzes`: List of quizzes with course code, day, slot, and required number of proctors.
     - `TeachingSchedule`: Weekly teaching schedule for TAs.
     - `ProctoringSchedule`: Resulting list of quizzes with assigned proctors.

2. **free_schedule(AllTAs, TeachingSchedule, FreeSchedule)**
   - Generates a schedule showing when each TA is free.
   - **Parameters:**
     - `AllTAs`: List of TAs with their names and days off.
     - `TeachingSchedule`: Weekly teaching schedule for TAs.
     - `FreeSchedule`: Resulting schedule of when TAs are free.

3. **assign_quizzes(Quizzes, FreeSchedule, ProctoringSchedule)**
   - Assigns free TAs to quizzes ensuring the required number of proctors.
   - **Parameters:**
     - `Quizzes`: List of quizzes with course code, day, slot, and required number of proctors.
     - `FreeSchedule`: Schedule of when TAs are free.
     - `ProctoringSchedule`: Resulting list of quizzes with assigned proctors.

4. **assign_quiz(Quiz, FreeSchedule, AssignedTAs)**
   - Assigns TAs to a single quiz from the free schedule.
   - **Parameters:**
     - `Quiz`: A single quiz structure.
     - `FreeSchedule`: Schedule of when TAs are free.
     - `AssignedTAs`: List of TAs assigned to the quiz.

### Example Usage
- **assign_proctors/4**: Determines possible proctor assignments for all quizzes.
- **free_schedule/3**: Calculates when TAs are available based on their teaching schedules and days off.
- **assign_quizzes/3**: Assigns available TAs to all quizzes.
- **assign_quiz/3**: Finds possible TAs for a single quiz from the free schedule.

