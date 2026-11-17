shift = 5
word = "LAB"
# no one will know I'm doing this lab!

for letter in word:
    hackerman = ord(letter)
    encode = hackerman + shift - (26 if hackerman + shift > 90 else 0)
    decode = encode - shift + (26 if encode - shift < 65 else 0)
    print(f"{letter} ({hackerman}) -> {chr(encode)} ({encode}) -> {chr(decode)} ({decode})")