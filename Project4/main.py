class Product:
    def __init__(self, name, price, discountPercent):
        self.__name = name
        self.__price = price
        self.__discountPercent = discountPercent

    def getDiscountAmount(self):
        return self.__price * self.__discountPercent

    def getDiscountPrice(self):
        return self.__price - self.getDiscountAmount()

    def printDescription(self):
        print("Name: {}, Price: ${:,.2f}, DiscountPercent: {:,.1f}%, DiscountAmount: ${:,.2f}, DiscountPrice: ${:,.2f}".format(self.__name, self.__price, (self.__discountPercent * 100), self.getDiscountAmount(), self.getDiscountPrice()))

class Book(Product):
    def __init__(self, author, name, price, discountPercent):
        self.__author = author
        Product.__init__(self, name, price, discountPercent)

    def printDescription(self):
        print("Author: {}, ".format(self.__author), end="")
        Product.printDescription(self)

class Movie(Product):
    def __init__(self, year, name, price, discountPercent):
        self.__year = year
        Product.__init__(self, name, price, discountPercent)

    def printDescription(self):
        print("Year: {}, ".format(self.__year), end="")
        Product.printDescription(self)

product = Product("Rubik's Cube", 60, 0.3)
book = Book("Robert W. Sebesta", "Concepts of Programming Languages (11th Edition)", 160, 0.2)
movie = Movie(2018, "Ready Player One", 20, 0.1)

product.printDescription()
book.printDescription()
movie.printDescription()
