#!/usr/bin/env python

from setuptools import setup, find_packages

setup(
    name='hello_world',
    version='0.0.1',
    description='example uwsgi hello world app',
    author='Thomas Marks',
    author_email='tom.marks@mediagamma.com',
    packages=find_packages(),
    install_requires=[
        'uwsgi'
    ]
)
