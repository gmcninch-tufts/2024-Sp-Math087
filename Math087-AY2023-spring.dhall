-- Time-stamp: <2024-01-13 Sat 08:44 EST - george@valhalla>
let Dow = < Mon | Tue | Wed | Thu | Fri | Sat | Sun >

let concat = https://prelude.dhall-lang.org/List/concat

let EventTime = { start : Text, end : Text }

let ScheduleDetails =
      < DowTufts : { dow : Dow, time : EventTime, location : Text }
      | DowActual : { dow : Dow, time : EventTime, location : Text }
      | DowDue : { dow : Dow, deadline : Text }
      | Date : { date : Text, time : EventTime, location : Text }
      | DateDue : { date : Text, deadline : Text }
      >

let CourseComponent =
      < Lecture :
          { sched : List ScheduleDetails
          , description : Text
          , topics : List Text
          }
      | Recitation :
          { sched : List ScheduleDetails
          , description : Text
          , instructor : Text
          , topics : List Text
          }
      | Assignment :
          { sched : List ScheduleDetails
          , description : Text
          , assignments : List Text
          }
      | Exam : { sched : List ScheduleDetails, description : Text }
      >

let Task =
      < Repeating : { description : Text, dow : Dow, taskStaffList : List Text }
      | Single : { description : Text, deadline : Text, taskStaff : Text }
      | Meeting :
          { description : Text, time : EventTime, location : Text, dow : Dow }
      >

let tasks = [] : List Task

let homework =
      CourseComponent.Assignment
        { description = "Homework collected on gradescope"
        , sched =
          [ ScheduleDetails.DowDue { dow = Dow.Fri, deadline = "23:59" } ]
        , assignments = ./topics/assignments.dhall : List Text
        }

let lectures =
      CourseComponent.Lecture
        { sched =
          [ ScheduleDetails.DowTufts
              { dow = Dow.Wed
              , time = { start = "09:00", end = "10:15" }
              , location = "JCC 502"
              }
          , ScheduleDetails.DowTufts
              { dow = Dow.Mon
              , time = { start = "09:00", end = "10:15" }
              , location = "JCC 502"
              }
          ]
        , topics = ./topics/lectures.dhall : List Text
        , description = "course lecture"
        }

let FinalProject =
      CourseComponent.Assignment
        { description = "Final Project Due"
        , sched =
          [ ScheduleDetails.DateDue { date = "2024-04-03", deadline = "23:59" }
          , ScheduleDetails.DateDue { date = "2024-05-03", deadline = "23:59" }
          ]
        , assignments = [ "Final project proposals due", "Final Project Due" ]
        }

in  [ { courseAY = "AY2023-2024"
      , courseSem = "spring"
      , title = "Math087"
      , sections = [ "01" ]
      , chair = "George McNinch"
      , instructors = [] : List Text
      , tas = [ "" ]
      , courseDescription = "Mathematical Modelling"
      , target =
        { dir = "course-pages", base = "Math087", org = "/home/george/org/" }
      , courseComponents =
          concat
            CourseComponent
            (   [ [ lectures ], [ homework, FinalProject ] ]
              : List (List CourseComponent)
            )
      , courseTasks = tasks : List Task
      }
    ]