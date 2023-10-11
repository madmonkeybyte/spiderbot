#!/usr/bin/env python3
# -*- coding; utf-8 -*-
#

"""
Frederico Sales
<frederico@fredericosales.eng.br>
2023
"""

# imports
# 
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy import Table, Column, MetaData, Integer, Computed
import logging


class CreateTables(object):
    """
    """

    def __init__(self, user, database, host, password):
        """
        """
        self.user = user
        self.database = database
        self.host = host
        self.password = password
        self.meta = MetaData
        self.engine = create_engine("postgresql+psycopg2://self.user:self.password@self.host/self.db")
        logging.basicConfig()
        logging.getLogger('sqlalchemy.dialects.postgresql').setLevel(logging.INFO)

