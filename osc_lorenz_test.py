#!/usr/bin/env python3
"""Lorenz attractor → OSC sender for TouchDesigner testing.
Simulates the chaos resonator's OSC output.
Usage: python3 osc_lorenz_test.py
Press Ctrl+C to stop.
"""
import socket, struct, time, math

PORT = 7000
HOST = '127.0.0.1'
FPS = 30
DT = 0.01  # Lorenz integration step (4x per frame)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

def osc_float(addr, val):
    addr_b = addr.encode() + b'\x00'
    pad = (4 - len(addr_b) % 4) % 4
    addr_b += b'\x00' * pad
    return addr_b + b',f\x00\x00' + struct.pack('>f', val)

def send(addr, val):
    sock.sendto(osc_float(addr, val), (HOST, PORT))

# Lorenz state
x, y, z = 1.0, 1.0, 1.0
sigma, rho, beta = 10.0, 28.0, 2.667

print(f"Lorenz OSC sender → {HOST}:{PORT} at {FPS}fps")
print("Press Ctrl+C to stop")

frame = 0
try:
    while True:
        # 4x Euler integration per frame
        for _ in range(4):
            dx = sigma * (y - x)
            dy = x * (rho - z) - y
            dz = x * y - beta * z
            x += dx * DT
            y += dy * DT
            z += dz * DT

        # Clamp (safety)
        x = max(-100, min(100, x))
        y = max(-100, min(100, y))
        z = max(-100, min(100, z))

        # Simulate amplitude from chaos velocity
        amp = min(1.0, math.sqrt(x*x + y*y) * 0.02)

        send('/chaos/x', x)
        send('/chaos/y', y)
        send('/chaos/z', z)
        send('/audio/amplitude', amp)

        if frame % 60 == 0:
            print(f"  x={x:.2f} y={y:.2f} z={z:.2f} amp={amp:.3f}")

        frame += 1
        time.sleep(1.0 / FPS)
except KeyboardInterrupt:
    print("\nStopped.")
    sock.close()
