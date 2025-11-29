import osc

fn main(){
	addr := "127.0.0.1:8765"
    d := osc.new_standard_dispatcher()
    d.add_msg_handler("/message/address", fn(msg &osc.Message) {
        osc.print_message(msg)
    })

    server := osc.Server{
        addr: addr,
        dispatcher: d,
    }
    server.listen_and_serve()
}