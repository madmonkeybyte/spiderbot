#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
"""
Frederico Sales
<frederico@fredericosales.eng.br>
2023

"""

# imports
import scrapy


# class 
class SpiderBot(scrapy.Spyder):
    """
    Scrapy some data on the internet.
    To run: scrapy runspider ./main.py

    """
    name = "SpiderBot"
    start_urls = ["https://www.alura.com.br/cursos-online-programacao"]

    def parse(self):
        """
        """
        _SELECT = ".subcategoria__item"
        lectures = []

        for category in response.css(_SELECT):
            lecture = {}
            
            _SELECT_NAME = ".card-curso__nome ::text"
            _LINK_SELECT = ".card-curso ::attr(href)"

            lecture['name'] = category.css(_SELECT_NAME).extract_first()
            lecture['link'] = "https://alura.com.br" + category.css(_LINK_SELECT).extract_first()

            lectures.append(lecture)
        
        return lectures, len(lectures)
