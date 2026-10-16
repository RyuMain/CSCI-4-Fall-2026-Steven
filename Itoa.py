import os

number = 1234

buffer = bytearray(20)
pos = 20
count = 0

while True:
    number, digit = divmod(number, 10)
    digit += ord('0')
    pos -= 1
    buffer[pos] = digit
    count += 1
    if number == 0:
        break

text = bytes(buffer[pos:pos + count])

os.write(1, text)
os.write(1, b"\n")