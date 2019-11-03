#!/usr/bin/env python3
#title          :main.py
#description    :Displays the use of polymorphic functions.
#author         :Jared Diehl
#date           :20191103
#version        :1.0
#usage          :python3 main.py
#notes          :CMPSCI4250 Project4

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
