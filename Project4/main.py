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
        name = self.__name
        price = self.__price
        discountPercent = (self.__discountPercent * 100)
        discountAmount = self.getDiscountAmount()
        discountPrice = self.getDiscountPrice()
        print("Name: {}, Price: ${:,.2f}, DiscountPercent: {:,.1f}%, DiscountAmount: ${:,.2f}, DiscountPrice: ${:,.2f}".format(name, price, discountPercent, discountAmount, discountPrice))

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
print("product = Product(\"Rubik's Cube\", 60, 0.3)")
print("Calling product.getDiscountAmount() returns ${:,.2f}".format(product.getDiscountAmount()))
print("Calling product.getDiscountPrice() returns ${:,.2f}".format(product.getDiscountPrice()))
print("Calling product.printDescription() prints ", end="")
product.printDescription()

print("-------------------------------------")

book = Book("John D. Clark", "Ignition!", 16, 0.2)
print("book = Book(\"John D. Clark\", \"Ignition!\", 16, 0.2)")
print("Calling book.getDiscountAmount() returns ${:,.2f}".format(book.getDiscountAmount()))
print("Calling book.getDiscountPrice() returns ${:,.2f}".format(book.getDiscountPrice()))
print("Calling book.printDescription() prints ", end="")
book.printDescription()

print("-------------------------------------")

movie = Movie(2018, "Ready Player One", 20, 0.1)
print("movie = Movie(2018, \"Ready Player One\", 20, 0.1)")
print("Calling movie.getDiscountAmount() returns ${:,.2f}".format(movie.getDiscountAmount()))
print("Calling movie.getDiscountPrice() returns ${:,.2f}".format(movie.getDiscountPrice()))
print("Calling movie.printDescription() prints ", end="")
movie.printDescription()

print("-------------------------------------")
