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
      return "name: " + self.__name + ", price: " + str(self.__price) + ", discountPercent: " + str(self.__discountPercent) + ", discountAmount: " + str(self.getDiscountAmount()) + ", discountPrice: " + str(self.getDiscountPrice())

class Book(Product):
    def __init__(self, author, name, price, discountPercent):
        self.__author = author
        Product.__init__(self, name, price, discountPercent)

    def printDescription(self):
        return "author: " + self.__author + ", " + Product.printDescription(self)

class Movie(Product):
    def __init__(self, year, name, price, discountPercent):
        self.__year = year
        Product.__init__(self, name, price, discountPercent)

    def printDescription(self):
        return "year: " + str(self.__year) + ", " + Product.printDescription(self)

product = Product("test", 10, 0.1)
book = Book("me", "test1", 12, 0.5)
movie = Movie(2019, "test2", 100, 0.2)

print(product.printDescription())
print(book.printDescription())
print(movie.printDescription())
