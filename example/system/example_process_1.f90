! Process example 1: Run a Command Synchronously and Capture Output
program run_sync
    use stdlib_system, only: run, is_completed, process_type
    implicit none

    type(process_type) :: p
    logical :: completed

    ! Run a synchronous process to list directory contents
    p = run("ls -l", wait=.true., want_stdout=.true.)

    ! Check if the process is completed (should be true since wait=.true.)
    if (is_completed(p)) then
        print *, "Process completed successfully. The current directory: "
        print *, p%stdout
    else
        print *, "Process is still running (unexpected)."
    end if
    
end program run_sync
