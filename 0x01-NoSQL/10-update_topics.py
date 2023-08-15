#!/usr/bin/env python3
"""
    Defines update_topics function
"""
from typing import List


def update_topics(mongo_collection, name: str, topics: List[str]):
    """
        a function that searches a database by name and change the topic.
        Args:
            mongo_collection (_type_): collection linked to the database
            name (String): name of the document 
            topics (List[String]): name of the new topic
    """
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
