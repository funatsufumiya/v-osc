# V OSC (go-osc port)

> [!WARNING]
> ***WORK IN PROGRESS. Not ready for use.***<br>
> Please use [vosc](https://github.com/funatsufumiya/vosc) (nim's nosc port) instead now.

[Open Sound Control (OSC)](http://opensoundcontrol.org) library for V language. Implemented in pure V.

Ported from [go-osc](https://github.com/hypebeast/go-osc).

## Features

-   OSC Bundles, including timetags
-   OSC Messages
-   OSC Client
-   OSC Server
-   Supports the following OSC argument types:
    -   'i' (Int32)
    -   'f' (Float32)
    -   's' (string)
    -   'b' (blob / binary data)
    -   'h' (Int64)
    -   't' (OSC timetag)
    -   'd' (Double/int64)
    -   'T' (True)
    -   'F' (False)
    -   'N' (Nil)
-   Support for OSC address pattern including '\*', '?', '{,}' and '[]' wildcards

## Install

```bash
$ git clone https://github.com/funatsufumiya/v-osc ~/.vmodules/osc
```

## Usage

### Client

see [examples/example_sender/main.v](./examples/example_sender/main.v)

```v
import osc

fn main() {
    client := osc.new_client("localhost", 8765)
    msg := osc.new_message("/osc/address")
    msg.append(int32(111))
    msg.append(true)
    msg.append("hello")
    client.send(msg)
}
```

### Server

see [examples/example_receiver/main.v](./examples/example_receiver/main.v)

```v
import osc

fn main() {
    addr := "127.0.0.1:8765"
    d := osc.new_standard_dispatcher()
    d.add_msg_handler("/message/address", fn(msg *osc.Message) {
        osc.print_message(msg)
    })

    server := &osc.server{
        addr: addr,
        dispatcher:d,
    }
    server.listen_and_serve()
}
```

## Tests

```bash
$ v test .
```



