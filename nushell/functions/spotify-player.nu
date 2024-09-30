#!/usr/bin/env nu

# parse dbus launch output
def parse_dbus_launch []: nothing -> record {
    let output = (dbus-launch --auto-syntax | lines)
    let address = ($output 
        | get 0 
        | split row "'" 
        | get 1)
    let pid = ($output 
        | get 2 
        | split row "=" 
        | get 1 
        | str replace ";" "")
    {
        DBUS_SESSION_BUS_ADDRESS: $address,
        DBUS_SESSION_BUS_PID: $pid
    }
}


export def spotify []: nothing -> nothing {
    # check if dbus session is already running
    if ($env | get -i DBUS_SESSION_BUS_ADDRESS | is-empty) {
        # if not, start a new session
        let dbus_env = (parse_dbus_launch)
        load-env $dbus_env
        echo "Started new D-Bus session"
        print $dbus_env
    } else {
        echo "Using existing D-Bus session"
    }


    spotify_player

    # clean up dbus session if we spawned a new process id
    if (not ($env | get -i DBUS_SESSION_BUS_ADDRESS | is-empty)) and (not ($env | get -i DBUS_SESSION_BUS_PID | is-empty)) {
        kill $env.DBUS_SESSION_BUS_PID
        echo "Cleaned up D-Bus session"
    } 
}

