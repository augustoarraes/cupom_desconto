import uuid, os
from datetime import datetime
from model import db
from flask import jsonify, request, session
from functools import wraps
from model import db


HTTP_METHODS = ['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'CONNECT', 'OPTIONS', 'TRACE', 'PATCH']



