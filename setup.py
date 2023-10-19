from setuptools import setup
from os import path
from io import open

here = path.abspath(path.dirname(__file__))

with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='http_server',
    version='0.1',
    description='HTTPS server.',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='https://github.com/jgfaisca/HTTPServer',
    license='MIT',
    classifiers=[
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 3',
        ],
    py_modules=['http_server']
)
