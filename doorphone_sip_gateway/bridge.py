import socket

UDP_RX = 5005
UDP_TX = 5006
ESP32_IP = "192.168.1.133"

sock_rx = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock_rx.bind(("0.0.0.0", UDP_RX))

sock_tx = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

fifo_in = open("/tmp/audio_in", "wb")
fifo_out = open("/tmp/audio_out", "rb")

print("Bridge iniciado")

while True:
    data, _ = sock_rx.recvfrom(1024)

    # ESP32 → SIP
    fifo_in.write(data)
    fifo_in.flush()

    # SIP → ESP32
    try:
        out = fifo_out.read(320)
        if out:
            sock_tx.sendto(out, (ESP32_IP, UDP_TX))
    except:
        pass
