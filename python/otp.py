import string
import random

def otp_gen():
	otp_str = ""
	for i in range(3):
		otp_str = otp_str + random.SystemRandom().choice(string.ascii_uppercase) + random.SystemRandom().choice(string.digits)
	return otp_str
for i in range(6):
	otp = otp_gen()
	print otp
