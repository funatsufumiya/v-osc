import osc

fn main(){
	addr := "127.0.0.1:8765"
    d := osc.NewStandardDispatcher()
    d.AddMsgHandler("/message/address", fn(msg *osc.Message) {
        osc.PrintMessage(msg)
    })

    server := &osc.Server{
        Addr: addr,
        Dispatcher:d,
    }
    server.ListenAndServe()
}