class Complex:
    def __init__(self, realpart, imagpart):
        self.r = realpart
        self.i = imagpart

x = Complex(5, imagpart=8)
x.r = 10
x.i = 20
print x.r, x.i
