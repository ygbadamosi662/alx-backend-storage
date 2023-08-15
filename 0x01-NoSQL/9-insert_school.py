#!/usr/bin/env python3
"""
    Defines insert_school
"""


def insert_school(mongo_collection, **kwargs):
    """
        a function that inserts data into the database using key-
        word argument.
        Args:
            mongo_collection (_type_): collection linked to the database.
            kwargs (Dict): dictionary containing the key-word argument
        Returns:
            String: the new generated id
    """
    data = {k: v for k, v in kwargs.items()}
    return mongo_collection.insert_one(data).inserted_id
