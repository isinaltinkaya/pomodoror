#' Pomodoror
#'
#'
#' Work more productively with Pomodoror!
#' @param pomodoros Integer value for the number of repetitions.
#' @param work_length Amount of time in minutes to work before a break.
#' @param break_length Amount of time in minutes to break before getting back to work.
#' @param work_start Noise to make to signal beginning of work time.
#' @param work_end Noise to make to signal end of work time/beginning of break time.
#' @param work_finish Noise to make at after all pomodoros are completed.
#' @export
#'
#'


pomodoror <- function(
  pomodoros = 4,
  work_length = 25,
  break_length = 5,
  work_start = "mario",
  work_end = "complete",
  work_finish = "fanfare"
){
  pomodoros = pomodoros
  work_length = work_length
  break_length = break_length

  for(i in 1:pomodoros){
    beepr::beep(sound = work_start)
    f = file(".pomodoror.log")
    writeLines(stringr::str_glue("round {i}: work for: {work_length} mins: {work_length} mins left"), f)
    close(f)

    for(t in 1:work_length){
      Sys.sleep(60)
      f = file(".pomodoror.log")
      writeLines(stringr::str_glue("round {i}: work for: {work_length} mins: {work_length-t} mins left"), f)
      close(f)
    }

    if(i == pomodoros){
      beepr::beep(sound = work_finish)

    } else{
      beepr::beep(sound = work_end)
      f = file(".pomodoror.log")
      writeLines(stringr::str_glue("round {i}: break for: {break_length} mins: {break_length} mins left"), f)
      close(f)

      for(t in 1:break_length){
        Sys.sleep(60)
        f = file(".pomodoror.log")
        writeLines(stringr::str_glue("round {i}: break for: {break_length} mins: {break_length-t} mins left"), f)
        close(f)
      }
    }
  }
}

