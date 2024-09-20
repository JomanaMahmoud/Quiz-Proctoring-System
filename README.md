# Quiz Proctoring System

## Project Description
A Prolog program to assign Teaching Assistants (TAs) as proctors for quizzes based on their teaching schedules. The system will handle quizzes scheduled at different times during the week, ensuring each quiz has the required number of proctors while considering the constraints of TAs' availability.

#### Key Constraints
1. Each quiz requires a specific number of proctors.
2. TAs cannot proctor during their teaching slots.
3. TAs cannot proctor on their day off.
4. A TA cannot proctor more than one quiz at the same time.

#### Required Predicates
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

#### Example Usage
- **assign_proctors/4**: Determines possible proctor assignments for all quizzes.
- **free_schedule/3**: Calculates when TAs are available based on their teaching schedules and days off.
- **assign_quizzes/3**: Assigns available TAs to all quizzes.
- **assign_quiz/3**: Finds possible TAs for a single quiz from the free schedule.

## How to Install

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yehiarasheed/Quiz-Proctoring-System.git
   cd Quiz-Proctoring-System
   ```
   This command downloads a copy of the repository to your local machine and navigates into the project directory.

2. **Install SWI-Prolog:**
   Download and install SWI-Prolog from the [official SWI-Prolog website](https://www.swi-prolog.org). SWI-Prolog is the recommended Prolog compiler for this project.

3. **Open the Project:**
   - Launch SWI-Prolog.
   - Consult the project files by loading them into SWI-Prolog:
     ```prolog
     consult('path_to_file.pl').
     ```
   Replace 'path_to_file.pl' with the actual path to the Prolog file you want to load.
   - Alternatively, use the consult button in SWI-Prolog by navigating to File → Consult.

## Dependencies

This project requires the following dependencies:

- **SWI-Prolog**: The recommended Prolog compiler for running the Quiz Proctoring System.

Ensure SWI-Prolog is installed and properly configured on your machine to run the Prolog code in this project.

## Credits
- **Developers**: Jomana Mahmoud, Nada Yasser, Rawan Hossam, Amr Osama & Yehia Rasheed.

All media used in this project, including images and videos, are credited to their respective creators and used under fair use for educational and demonstration purposes. If you plan to use this project for commercial purposes, you must ensure you have obtained the necessary licenses or permissions for any copyrighted media.

---
