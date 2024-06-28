free_schedule(AllTAs, [], []).
free_schedule_helper(AllTAs, day(DayName,[]), []).
free_schedule_helper2([],DayName,Slot,[]).

free(DayName,ta(Name,DayOff),Slot):-
DayName\=DayOff,
\+member(Name,Slot).

free_schedule(AllTAs, TeachingSchedule, FreeSchedule):-
    TeachingSchedule = [day(DayName, DaySchedule)|T1],
    free_schedule_helper(AllTAs, day(DayName, DaySchedule),FreeFirstDay),
	FreeSchedule = [day(DayName,FreeFirstDay)|FreeRestOfWeek],
	free_schedule(AllTAs, T1, FreeRestOfWeek).


free_schedule_helper(AllTAs, day(DayName, DaySchedule), FreeDay):-
    DaySchedule = [H|T],	
    free_schedule_helper2(AllTAs,DayName,H,FreeDayFirstSlot),
	permutation(FreeDayFirstSlot,FreeDayFirstSlotPerm),
    free_schedule_helper(AllTAs, day(DayName,T), FreeDayRestOfSlots),
	FreeDay = [FreeDayFirstSlotPerm|FreeDayRestOfSlots].
    

free_schedule_helper2(AllTAs,DayName,Slot,FreeDayPerSlot):-
    AllTAs = [ta(Name,Day_Off)|T],
    free(DayName,ta(Name,Day_Off),Slot),
    FreeDayPerSlot = [Name | FreeDayPerSlotRestOfTAs],
    free_schedule_helper2(T,DayName,Slot,FreeDayPerSlotRestOfTAs),
	FreeDayPerSlot = [Name|FreeDayPerSlotRestOfTAs].
    
free_schedule_helper2(AllTAs,DayName,Slot,FreeDayPerSlot):-
    AllTAs = [ta(Name,Day_Off)|T],
    \+free(DayName,ta(Name,Day_Off),Slot),    
    free_schedule_helper2(T,DayName,Slot,FreeDayPerSlot).

	
deleteBusyTAs([],NewSlot,NewSlot).
	
deleteBusyTAs(AssignedTAs,Slot,NewSlot):-
AssignedTAs =[H|T],
delete(Slot,H,NewSlot1),
deleteBusyTAs(T,NewSlot1,NewSlot).

replace_nth0(List, Index, OldElem, NewElem, NewList) :-
   % predicate works forward: Index,List -> OldElem, Transfer
   nth0(Index,List,OldElem,Transfer),
   % predicate works backwards: Index,NewElem,Transfer -> NewList
   nth0(Index,NewList,NewElem,Transfer).

createNewFreeSchedule([],_,_,_,_,[]).

createNewFreeSchedule([day(Day,Schedule)|T],DayName,AssignedTAs,TAs,Slot,NewFreeSchedule):-
Day = DayName,
deleteBusyTAs(AssignedTAs,TAs,TAsLeft),
Slot1 is Slot-1,
replace_nth0(Schedule,Slot1,TAs,TAsLeft,Schedule1),
NewFreeSchedule = [day(Day,Schedule1)|T1],
createNewFreeSchedule(T,DayName,AssignedTAs,TAs,Slot,T1).

createNewFreeSchedule([day(Day,Schedule)|T],DayName,AssignedTAs,TAs,Slot,NewFreeSchedule):-
Day \= DayName,
NewFreeSchedule = [day(Day,Schedule)|T1],
createNewFreeSchedule(T,DayName,AssignedTAs,TAs,Slot,T1).


assign_quizhelper(Quiz,[],[]).

assign_quiz(Quiz,FreeSchedule,AssignedTAs):-
assign_quizhelper(Quiz,FreeSchedule,AssignedTAs).



assign_quizhelper(Quiz, FreeSchedule,AssignedTAs):-
Quiz = quiz(Course,Day,Slot,Count)	,
FreeSchedule = [day(DayName,Schedule)|T] ,
DayName = Day,
%select_slot_num_with_the_index
nth1(Slot,Schedule,TAs),
length(TAs,Len1),
Count =< Len1,
selectTAs(TAs,Count,AssignedTAs).

assign_quizhelper(Quiz, FreeSchedule, AssignedTAs):-
Quiz = quiz(Course,Day,Slot,Count)	,
FreeSchedule = [day(Dayname,Schedule)|T] ,
Day \= Dayname,
assign_quizhelper(Quiz,T,AssignedTAs).

selectTAs(_,0,[]).

selectTAs(TAs,Count,Result):-
Count > 0,
Result = [H|T1],
select(H,TAs,Remaining),
Count1 is Count - 1,
selectTAs(Remaining,Count1,T1).

getSlotTAs([],_,_,TAs).

getSlotTAs(FreeSchedule,Day,Slot,TAs):-
FreeSchedule = [day(DayName,Schedule)|T] ,
DayName = Day,
nth1(Slot,Schedule,TAs).

getSlotTAs(FreeSchedule,Day,Slot,TAs):-
FreeSchedule = [day(DayName,Schedule)|T] ,
DayName \= Day,
getSlotTAs(T,Day,Slot,TAs).

assign_quizzes([], _, []).

assign_quizzes(Quizzes, FreeSchedule, ProctoringSchedule):-
Quizzes = [H|T],
H = quiz(Course,Day,Slot,Count),
assign_quizhelper(H,FreeSchedule,AssignedTAs),
ProctoringSchedule = [proctors(H,AssignedTAs)|Remaining],
getSlotTAs(FreeSchedule,Day,Slot,TAs),
createNewFreeSchedule(FreeSchedule,Day,AssignedTAs,TAs,Slot,NewFreeSchedule),
assign_quizzes(T, NewFreeSchedule, Remaining).


assign_proctors(AllTAs, Quizzes, TeachingSchedule, ProctoringSchedule):-
free_schedule(AllTAs,TeachingSchedule,FreeSchedule),
!,
assign_quizzes(Quizzes,FreeSchedule,ProctoringSchedule).
	