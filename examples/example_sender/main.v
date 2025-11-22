import osc

fn main(){
	client := osc.new_client("localhost", 8765)
    msg := osc.new_message("/osc/address")
    msg.append(int32(111))
    msg.append(true)
    msg.append("hello")
    client.send(msg)
}